//
//  CompletionEvent.swift
//  Wibmo3ds
//
//  Created by neeraj goyal on 15/02/18.
//

import Foundation

@objc public class CompletionEvent : NSObject {
    
    public var sdkTransactionID: String
    public var transactionStatus: String
    
    public init(sdkTransactionID: String, transactionStatus: String) {
        self.sdkTransactionID = sdkTransactionID
        self.transactionStatus = transactionStatus
    }
    
    public func getSDKTransactionID() -> String {
        return sdkTransactionID
    }
    
    public func getTransactionStatus() -> String {
        return transactionStatus
    }
}
