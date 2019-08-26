//
//  ChallengeParameters.swift
//  Wibmo3ds
//
//  Created by neeraj goyal on 15/02/18.
//

import Foundation

///The ChallengeParameters class shall hold the parameters that are required to conduct the challenge process.

@objc public class ChallengeParameters : NSObject {
    
    public var a3DSServerTransactionID: String?
    public var acsTransactionID: String?
    public var acsRefNumber: String?
    public var acsSignedContent: String?
    public var threeDSServerTransactionID: String?
    public var acsRenderingType: ACSUIType?
    
    /// Initializing ChallengeParameters with all the required parameters
    /// - Parameters:
    ///      - a3DSServerTransactionID: Transaction identifier assigned by the 3DS Server to uniquely identify a single transaction
    ///      - acsTransactionID: Transaction ID assigned by the ACS to uniquely identify a single transaction
    ///      - acsRefNumber:  EMVCo assigns the ACS this identifier after running the EMV 3-D Secure Testing and Approvals process on the ACS
    ///      - acsSignedContent: ACS signed content. This data includes the ACS URL, ACS ephemeral public key, and SDK ephemeral public key
  
    public init(a3DSServerTransactionID: String? = nil,
                acsTransactionID: String? = nil,
                acsRefNumber: String? = nil,
                acsSignedContent: String? = nil,
                threeDSServerTransactionID: String? = nil,
                acsRenderingType:ACSUIType? = nil ) {
        
        self.a3DSServerTransactionID = a3DSServerTransactionID
        self.acsTransactionID = acsTransactionID
        self.acsRefNumber = acsRefNumber
        self.acsSignedContent = acsSignedContent
        self.threeDSServerTransactionID = threeDSServerTransactionID
        self.acsRenderingType = acsRenderingType
    }
    
    /// Sets the 3DS Server Transaction ID
    public func set3DSServerTransactionID(a3DSServerTransactionID: String) {
        self.a3DSServerTransactionID = a3DSServerTransactionID
    }
    
    /// Sets the ACS Transaction ID
    public func setAcsTransactionID(acsTransactionID: String) {
        self.acsTransactionID = acsTransactionID
    }
    
    /// Sets the ACS Reference Number
    public func setAcsRefNumber(acsRefNumber: String) {
        self.acsRefNumber = acsRefNumber
    }
    
    /// Sets the ACS signed content. This data includes the ACS URL, ACS ephemeral public key, and SDK ephemeral public key
    public func setACSSignedContent(acsSignedContent: String) {
        self.acsSignedContent = acsSignedContent
    }
    
    /// Returns the 3DS Server Transaction ID
    public func getA3DSServerTransactionID() -> String? {
        return a3DSServerTransactionID
    }
    
    /// Returns the ACS Transaction ID
    public func getAcsTransactionID() -> String? {
        return acsTransactionID
    }
    
    /// Returns the ACS Reference Number
    public func getAcsRefNumber() -> String? {
        return acsRefNumber
    }
    
    /// Returns the ACS signed content object
    public func getACSSignedContent() -> String? {
        return acsSignedContent
    }
}
