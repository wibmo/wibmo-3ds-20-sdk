//
//  CompletionEvent.swift
//  Wibmo3ds
//
//  Created by neeraj goyal on 15/02/18.
//

import Foundation

@objc public class CompletionEvent : NSObject {
    
    @objc public var sdkTransactionID: String
    @objc public var transactionStatus: String
    
    @objc public init(sdkTransactionID: String, transactionStatus: String) {
        self.sdkTransactionID = sdkTransactionID
        self.transactionStatus = transactionStatus
    }
    
    @objc public func getSDKTransactionID() -> String {
        return sdkTransactionID
    }
    
    @objc public func getTransactionStatus() -> String {
        return transactionStatus
    }
}
