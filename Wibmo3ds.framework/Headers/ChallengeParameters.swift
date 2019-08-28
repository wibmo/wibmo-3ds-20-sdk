//
//  ChallengeParameters.swift
//  Wibmo3ds
//
//  Created by neeraj goyal on 15/02/18.
//

import Foundation

///The ChallengeParameters class shall hold the parameters that are required to conduct the challenge process.

@objc public class ChallengeParameters : NSObject {
    
    var a3DSServerTransactionID: String?
    var acsTransactionID: String?
    var acsRefNumber: String?
    var acsSignedContent: String?
    var threeDSServerTransactionID: String?
    var acsRenderingType: ACSUIType?
    
    /// Initializing ChallengeParameters with all the required parameters
    /// - Parameters:
    ///      - a3DSServerTransactionID: Transaction identifier assigned by the 3DS Server to uniquely identify a single transaction
    ///      - acsTransactionID: Transaction ID assigned by the ACS to uniquely identify a single transaction
    ///      - acsRefNumber:  EMVCo assigns the ACS this identifier after running the EMV 3-D Secure Testing and Approvals process on the ACS
    ///      - acsSignedContent: ACS signed content. This data includes the ACS URL, ACS ephemeral public key, and SDK ephemeral public key
  
    @objc public init(a3DSServerTransactionID: String? = nil,
                acsTransactionID: String? = nil,
                acsRefNumber: String? = nil,
                acsSignedContent: String? = nil,
                threeDSServerTransactionID: String? = nil,
                acsRenderingType:ACSUITypeInt = ACSUITypeInt.unknown ) {
        super.init()
        self.a3DSServerTransactionID = a3DSServerTransactionID
        self.acsTransactionID = acsTransactionID
        self.acsRefNumber = acsRefNumber
        self.acsSignedContent = acsSignedContent
        self.threeDSServerTransactionID = threeDSServerTransactionID
        self.acsRenderingType = acsRendType(acsRenderingType: acsRenderingType)
    }
    
    private func acsRendType(acsRenderingType: ACSUITypeInt) -> ACSUIType {
        switch acsRenderingType {
        case .error:
            return ACSUIType.error
        case .unknown:
            return ACSUIType.unknown
        case .text:
            return ACSUIType.text
        case .singleSelect:
            return ACSUIType.singleSelect
        case .multiSelect:
            return ACSUIType.multiSelect
        case .oob:
            return ACSUIType.oob
        case .html:
            return ACSUIType.html
        }
    }
    
    /// Sets the 3DS Server Transaction ID
    @objc public func set3DSServerTransactionID(a3DSServerTransactionID: String) {
        self.a3DSServerTransactionID = a3DSServerTransactionID
    }
    
    /// Sets the ACS Transaction ID
    @objc public func setAcsTransactionID(acsTransactionID: String) {
        self.acsTransactionID = acsTransactionID
    }
    
    /// Sets the ACS Reference Number
    @objc public func setAcsRefNumber(acsRefNumber: String) {
        self.acsRefNumber = acsRefNumber
    }
    
    /// Sets the ACS signed content. This data includes the ACS URL, ACS ephemeral public key, and SDK ephemeral public key
    @objc public func setACSSignedContent(acsSignedContent: String) {
        self.acsSignedContent = acsSignedContent
    }
    
    /// Returns the 3DS Server Transaction ID
    @objc public func getA3DSServerTransactionID() -> String? {
        return a3DSServerTransactionID
    }
    
    /// Returns the ACS Transaction ID
    @objc public func getAcsTransactionID() -> String? {
        return acsTransactionID
    }
    
    /// Returns the ACS Reference Number
    @objc public func getAcsRefNumber() -> String? {
        return acsRefNumber
    }
    
    /// Returns the ACS signed content object
    @objc public func getACSSignedContent() -> String? {
        return acsSignedContent
    }
}
