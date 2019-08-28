//
//  ErrorMessage.swift
//  Wibmo3ds
//
//  Created by neeraj goyal on 15/02/18.
//

import Foundation

let kErrorComponent = "C"

@objc public class ErrorMessage: NSObject, Codable, Error {
    
    @objc public var threeDSServerTransID: String
    @objc public var errorCode: String
    @objc public var errorDescription: String
    @objc public var errorDetail: String?
    @objc public var acsTransID: String?
    @objc public var errorComponent: String?
    @objc public var errorMessageType: String?
    @objc public var messageType: String?
    @objc public var messageVersion: String?
    @objc public var sdkTransID: String?

    @objc public init(_ transactionID: String, _ errorCode: String, _ errorDescription: String, _ errorDetail: String?) {
        self.threeDSServerTransID = transactionID
        self.errorCode = errorCode
        self.errorDescription = errorDescription
        self.errorDetail = errorDetail
    }
    
    @objc public func getTransactionID() -> String {
        return threeDSServerTransID
    }
    
    @objc public func getErrorCode() -> String {
        return errorCode
    }
    
    @objc public func getErrorDescription() -> String {
        return errorDescription
    }
    
    @objc public func getErrorDetails() -> String? {
        return errorDetail
    }
}
