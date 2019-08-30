//
//  AuthenticationRequestParameters.swift
//  Wibmo3ds
//
//  Created by neeraj goyal on 15/02/18.
//

import Foundation

@objc public class AuthenticationRequestParameters : NSObject {
    
    @objc public private(set) var sdkTransactionID: String
    @objc public private(set) var deviceData: String
    @objc public private(set) var sdkEphemeralPublicKey: String
    @objc public private(set) var sdkAppID: String
    @objc public private(set) var sdkReferenceNumber: String
    @objc public private(set) var messageVersion: String
    
    @objc public init(sdkTransactionID: String, deviceData: String, sdkEphemeralPublicKey: String, sdkAppID: String, sdkReferenceNumber: String, messageVersion: String) throws {
        self.sdkTransactionID = sdkTransactionID
        self.sdkEphemeralPublicKey = sdkEphemeralPublicKey
        self.sdkAppID = sdkAppID
        self.sdkReferenceNumber = sdkReferenceNumber
        self.deviceData = deviceData
        self.messageVersion = messageVersion
    }
}
