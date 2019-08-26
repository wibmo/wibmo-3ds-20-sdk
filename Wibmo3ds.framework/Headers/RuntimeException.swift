//
//  RuntimeException.swift
//  Wibmo3ds
//
//  Created by neeraj goyal on 16/02/18.
//

import Foundation

@objc public class RuntimeException: NSObject, Error {
    private var message: String
    private var cause: String?
    
    public init(message: String, cause: String?) {
        self.message = message
        self.cause = cause
    }
}
