//
//  Wibmo3ds.swift
//  Wibmo3ds
//
//  Created by neeraj goyal on 15/02/18.
//

import Foundation
import SwiftyRSA

func print(_ items: Any...) {
    #if DEBUG
    Swift.print(items[0])
    #endif
}

func debugPrint(_ items: Any...) {
    #if DEBUG
    Swift.debugPrint(items[0])
    #endif
}

// MARK:- Public Enums
enum ProtocolConstants: String {
    case ThreeDS2SpecVer = "2.1.0"
}

enum MessageType: String, Codable {
    case areq = "AReq"
    case parq = "pArq"
    case ares = "ARes"
    case pars = "pArs"
    case creq = "CReq"
    case cres = "CRes"
    case error = "Erro"
}

enum MessageCategory: String, Codable {
    case paymentAuthentication =  "01"
    case nonPaymentAuthentication = "02"
}

enum TransactionType: String, Codable {
    case goodServicePurchase = "01"
    case checkAcceptance = "02"
    case accountFunding = "03"
    case cashTransaction = "04"
    case activationAndLoad = "27"
}

// MARK:- Private Internal Class
private class Wibmo3dsSetup {
    var isInitialized: Bool = false
    init() {
    }
}

// MARK:- Wibmo3ds
@objc public class Wibmo3ds : NSObject  {
    
    @objc public static let shared = Wibmo3ds()
    fileprivate let setup = Wibmo3dsSetup()
    @objc public var configParams: ConfigParameters?
    var app: UIApplication?
    fileprivate var customUi: UiCustomization?
    fileprivate var sdkLocale: String?
    var directoryServer: DirectoryServer?
    var messageVersion: String?
    fileprivate var transaction: WibmoTransaction?
    var delegate:Transaction?
    
    static func bundle() -> Bundle {
        let bundle = Bundle(for: Wibmo3ds.self)
        return bundle
    }
    
    static func resourceBundle() -> Bundle {
        let frameworkBundle = Wibmo3ds.bundle()
        let resourceBundle = Bundle(url: frameworkBundle.url(forResource: "Wibmo3ds", withExtension: "bundle")!)
        return resourceBundle!
    }
    
    @objc public static func storyboard() -> UIStoryboard {
        return UIStoryboard(name: "Wibmo3ds", bundle: Wibmo3ds.resourceBundle())
    }
    
    fileprivate override init() {
        setup.isInitialized = false
    }
    
    fileprivate var deviceInfo: DeviceInfo {
        return DeviceInfo()
    }
    
    func get3dsData() -> DeviceInfo {
        let di = deviceInfo
        return di
    }
    
    fileprivate func uiCustomization() -> UiCustomization {
        let verifyButtonCustomization = try! ButtonCustomization("#55c2b7ff", 5) //#5382BA #55c2b7ff
        let continueButtonCustomization = try! ButtonCustomization("#0099ffff", 5)
        let nextButtonCustomization = try! ButtonCustomization("#5382BAff", 5)  //0099ffff  7F7F7F
        let cancelButtonCustomization = try! ButtonCustomization("#e10531ff", 5)
        let resendButtonCustomization = try! ButtonCustomization("#7F7F7Fff", 5)  //fece00ff
        
        let btnCustomizations = [
            UiCustomization.ButtonType.VERIFY.rawValue : verifyButtonCustomization,
            UiCustomization.ButtonType.CONTINUE.rawValue : continueButtonCustomization,
            UiCustomization.ButtonType.NEXT.rawValue : nextButtonCustomization,
            UiCustomization.ButtonType.CANCEL.rawValue : cancelButtonCustomization,
            UiCustomization.ButtonType.RESEND.rawValue : resendButtonCustomization
        ]
        
        let labelCustomization = try! LabelCustomization()
        let toolBarCustomization = try! ToolbarCustomization("#ccccffff", "SECURE CHECKOUT", nil)
        let txtBxCustomization = try! TextBoxCustomization(1, 20, "#ccccffff")
        let customization = UiCustomization(btnCustomizations, toolBarCustomization, labelCustomization, txtBxCustomization)
        
        return customization
        
    }
}

//MARK:- WibmoTransactionClose Protocol
extension Wibmo3ds: WibmoTransactionClose {
    
    func closeTransaction() {
         self.transaction = nil
    }
}

//MARK: - ThreeDS2Service Protocol
extension Wibmo3ds: ThreeDS2Service {
    
    //keep it in assecding order only
    private func supportedMessageVersions() -> [String] {
        return ["2.1.0"]
    }
    
     @objc public func initialize(_ application: UIApplication?, _ configParameters: ConfigParameters?, _ locale: String?, _ uiCustomization: UiCustomization?) throws {
        
        guard setup.isInitialized == false else {
            throw SDKAlreadyInitializedException(message: "Wibmo3ds SDK has been initialized already.", cause: nil)
        }
        guard let config = configParameters else {
            throw InvalidInputException.init(message: "Config Parameters can not be nil", cause: nil)
        }
        app = application
        sdkLocale = locale ?? Locale.current.identifier
        configParams = config
        customUi = uiCustomization
     
        do {
            try checkWibmoSDKLicensing()
            try checkNotExpired()
        } catch {
            throw InvalidInputException.init(message: "Licensing Failed !", cause: nil)
        }
        
        setup.isInitialized = true
    }
    
    @objc public func createTransaction(_ directoryServerID: String, _ messageVersion: String?) throws -> Transaction {
        guard setup.isInitialized == true else {
            throw SDKNotInitializedException(message: "SDK not initialized", cause: nil)
        }
        // Invalid Directory Server ID or a protocol version that the 3DS SDK does not support.
        let sppMessageVersions = self.supportedMessageVersions()
        if let messsageVer = messageVersion {
            guard sppMessageVersions.contains(messsageVer) else {
                throw InvalidInputException(message: "Message Version not supported", cause: nil)
            }
            self.messageVersion = messageVersion
        } else {
            self.messageVersion = sppMessageVersions.last
        }
        
        do {
            if let key = try configParams?.getParamValue(nil, directoryServerID) {
                self.directoryServer = DirectoryServer(did: directoryServerID, pubKey: key)
            } else {
                throw InvalidInputException(message: "Directory Server key type not supported.", cause: nil)
            }
        } catch {
             throw InvalidInputException(message: "Directory Server ID mismatch", cause: nil)
        }
        
        self.transaction = WibmoTransaction(directoryServer: directoryServer!, jsonString: deviceInfo.jsonString!, messageVersion: messageVersion ?? "2.1.0")
        self.transaction?.delegate = self
        if self.customUi == nil {
            self.transaction?.uiCustomization = self.uiCustomization()
        } else {
            self.transaction?.uiCustomization = self.customUi
        }
        //TODO: REMOVE THIS LINE
        //self.transaction?.uiCustomization = self.uiCustomization()
        
        do {
            try transaction?.createAuthenticationParameters()
            guard let transaction = transaction else { throw SDKRuntimeException(message:"Transactio Error in SDK", errorCode: nil, cause: nil)}
            return transaction
        } catch{
            throw SDKRuntimeException(message: error.localizedDescription, errorCode: nil, cause: nil)
        }
    }
    
    @objc public func cleanup() throws {
        guard setup.isInitialized == true else {
            throw SDKNotInitializedException(message: "Wibmo3ds SDK is not initialized.", cause: nil)
        }
        setup.isInitialized = false
        app = nil
        sdkLocale = nil
        configParams = nil
        customUi = nil
        directoryServer = nil
        
    }
    
    @objc public func getSDKVersion() throws -> String {
        guard setup.isInitialized == true else {
            throw SDKNotInitializedException(message: "Wibmo3ds SDK is not initialized.", cause: nil)
        }
        return Bundle(for: Wibmo3dsSetup.self).infoDictionary!["CFBundleShortVersionString"] as! String
    }
    
    @objc public func getWarnings() -> [Warning] {
        if let sw = deviceInfo.SW {
            var warnings = [Warning]()
            for softwareWarning in sw {
                let w = DeviceInfo.SWarning(rawValue: softwareWarning)
                let warning = Warning(warn: w!)
                warnings.append(warning)
            }
            return warnings
        } else {
            return [Warning]()
        }
    }
}

extension Wibmo3ds {
    fileprivate func checkWibmoSDKLicensing() throws {
        
        let pemEncoded = """
-----BEGIN PUBLIC KEY-----
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAm/OrTVxqn6Gno7NLlpZv
z63V/f0lZdnqHhfGtbtHU0T7PNpgySNxXtivQ0zJmXGaFYz4uk8VwznvgzUby8Mz
br/CYHakgkJofaGe30WyR8rlrF99bpqvcSWyGDI/5GNcOkPIOpBYP7yMeOaEt9ll
czNVy1ufwnBgTJQSda6gnrazix6wRa6Irqyeb8KTwscs8ZigYWazHTeS7FE6eB5n
sRr7wv7ZpvGZQ4UAMVqGH5vqFJ+M1MmVWAmMyUMpfHvJ2Z4Z7ccYWF9qIKuzpzgW
6WGRmkWmvT10POPxJByiuyVTDqw2AYlRHupHj1JbHSWPURuaCmdFEfQQe5f+s8T/
cwIDAQAB
-----END PUBLIC KEY----
"""

        do {
            guard let licensingString = try configParams?.getParamValue(nil, "Wibmo_License") else {
                throw InvalidInputException.init(message: "Config Parameters can not be nil", cause: nil)
            }
            let jwsObject = try JWSObject(string: licensingString)
            
            guard jwsObject.header.verifyCertChain() == true else {
                throw SDKRuntimeException(message: "Certificate Chain didn't pass verification", errorCode: nil, cause: nil)
            }
            guard let firstCert = jwsObject.header.firstCertificate else {
                throw SDKRuntimeException(message: "JWS Header Certificate to verify again'st not available.", errorCode: nil, cause: nil)
            }
            guard let secPublicKey = firstCert.publicKey else {
                throw SDKRuntimeException(message: "JWS Header Certificate, no valid public key found", errorCode: nil, cause: nil)
            }
            
            guard let algo = jwsObject.header.algo else {
                throw SDKRuntimeException(message: "Invalid algorithm", errorCode: nil, cause: nil)
            }

            let pubKey = try PublicKey(pemEncoded: pemEncoded)
            
            guard pubKey.reference == secPublicKey else {
                throw SDKRuntimeException(message: "JWS Public Key Mismatch", errorCode: nil, cause: nil)
            }
            
            guard try jwsObject.verifySignature(publicKeyRef: pubKey.reference, algo: algo, certificatePem: nil) == true else {
                    throw SDKRuntimeException(message: "Invalid JWS Signature", errorCode: nil, cause: nil)
            }
            
        } catch {
            throw SDKRuntimeException(message: "Invalid public key", errorCode: nil, cause: nil)
        }
    }
    
    fileprivate func checkNotExpired() throws {
        do {
            guard let licensingString = try configParams?.getParamValue(nil, "Wibmo_License") else {
                throw InvalidInputException.init(message: "Config Parameters can not be nil", cause: nil)
            }
            let jwsObject = try JWSObject(string: licensingString)
            let base64Str = jwsObject.parts[1]
            
            guard let jsonString = base64Str.base64URLEncodedString() else {
                throw SDKRuntimeException(message: "Invalid Licensing Payload", errorCode: nil, cause: nil)
            }
            
            guard let dic = jsonString.dicFromJsonString() else {
                throw SDKRuntimeException(message: "Invalid Licensing Payload", errorCode: nil, cause: nil)
            }
            guard let issuer = dic["issuer"] as? String, issuer.lowercased() == "www.wibmo.com" else {
                throw SDKRuntimeException(message: "Invalid Issuer", errorCode: nil, cause: nil)
            }
            let nowDate = Date()
            print("nowDate : \(nowDate)")
            guard let expDateStr = dic["expiryDate"] as? String,
                let expDate = isoDate(string: expDateStr), expDate.compare(nowDate) == .orderedDescending else {
                throw SDKRuntimeException(message: "Invalid expiry date or expired", errorCode: nil, cause: nil)
            }
        } catch {
            throw SDKRuntimeException(message: "Invalid public key", errorCode: nil, cause: nil)
        }
    }
    
    fileprivate func isoDate(string: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = dateFormatter.date(from:string)
        return date
    }
}




