//
//  ErrorMessage.swift
//  Wibmo3ds
//
//  Created by neeraj goyal on 15/02/18.
//

import Foundation

let kErrorComponent = "C"

public class ErrorMessage: Codable, Error {
    
    public var threeDSServerTransID: String
    public var errorCode: String
    public var errorDescription: String
    public var errorDetail: String?
    public var acsTransID: String?
    public var errorComponent: String?
    public var errorMessageType: String?
    public var messageType: String?
    public var messageVersion: String?
    public var sdkTransID: String?

    public init(_ transactionID: String, _ errorCode: String, _ errorDescription: String, _ errorDetail: String?) {
        self.threeDSServerTransID = transactionID
        self.errorCode = errorCode
        self.errorDescription = errorDescription
        self.errorDetail = errorDetail
    }
    
    public func getTransactionID() -> String {
        return threeDSServerTransID
    }
    
    public func getErrorCode() -> String {
        return errorCode
    }
    
    public func getErrorDescription() -> String {
        return errorDescription
    }
    
    public func getErrorDetails() -> String? {
        return errorDetail
    }
}
