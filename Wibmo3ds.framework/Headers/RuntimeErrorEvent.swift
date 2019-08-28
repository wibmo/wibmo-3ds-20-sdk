//
//  RuntimeErrorEvent.swift
//  Wibmo3ds
//
//  Created by neeraj goyal on 15/02/18.
//

import Foundation

/// The RuntimeErrorEvent class shall hold details of run-time
/// errors that are encountered by the 3DS SDK during authentication

@objc public class RuntimeErrorEvent : NSObject {
    
    public var errorCode: String?
    public var errorMessage: String
    
    /// Constructs a RuntimeErrorEvent object
    /// - Parameters:
    ///      - errorCode: Specific error code, i.e not mandatory
    ///      - errorMessage: Error message
    @objc public init(_ errorCode: String?, _ errorMessage: String) {
        self.errorCode = errorCode
        self.errorMessage = errorMessage
    }
    
    /// Returns details about the error
    @objc public func getErrorMessage() -> String {
        return errorMessage
    }
    
    /// /// Returns the implementer-specific error code
    @objc public func getErrorCode() -> String? {
        return errorCode
    }    
}
