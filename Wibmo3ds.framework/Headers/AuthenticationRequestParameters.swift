//
//  AuthenticationRequestParameters.swift
//  Wibmo3ds
//
//  Created by neeraj goyal on 15/02/18.
//

import Foundation

@objc public class AuthenticationRequestParameters : NSObject {
    
    public var sdkTransactionID: String
    public var deviceData: String
    public var sdkEphemeralPublicKey: String
    public var sdkAppID: String
    public var sdkReferenceNumber: String
    public var messageVersion: String
    
    @objc public init(sdkTransactionID: String, deviceData: String, sdkEphemeralPublicKey: String, sdkAppID: String, sdkReferenceNumber: String, messageVersion: String) throws {
        self.sdkTransactionID = sdkTransactionID
        self.sdkEphemeralPublicKey = sdkEphemeralPublicKey
        self.sdkAppID = sdkAppID
        self.sdkReferenceNumber = sdkReferenceNumber
        self.deviceData = deviceData
        self.messageVersion = messageVersion
    }
    
    @objc public func getDeviceData() -> String {
        return deviceData
    }
    
    @objc public func getSDKTransactionID() -> String {
        return sdkTransactionID
    }
    
    @objc public func getSDKAppID() -> String {
        return sdkAppID
    }
    
    @objc public func getSDKReferenceNumber() -> String {
        return sdkReferenceNumber
    }
    
    @objc public func getSDKEphemeralPublicKey() -> String {
        return sdkEphemeralPublicKey
    }
    
    @objc public func getMessageVersion() -> String {
        return messageVersion
    }
}
