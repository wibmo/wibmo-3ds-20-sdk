//
//  SDKRuntimeException.swift
//  Wibmo3ds
//
//  Created by neeraj goyal on 15/02/18.
//

import Foundation

@objc public class SDKRuntimeException: RuntimeException {
    
   public private(set) var errorCode: String?
    
   @objc public init(message: String, errorCode: String?, cause: String?) {
        self.errorCode = errorCode
        super.init(message: message, cause: cause)
    }
    
//   @objc public func getErrorCode() -> String? {
//        return errorCode
//    }
}
