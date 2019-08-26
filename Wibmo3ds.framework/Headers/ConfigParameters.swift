//
//  ConfigParameters.swift
//  Wibmo3ds
//
//  Created by neeraj goyal on 15/02/18.
//

import Foundation

@objc public class ConfigParameters : NSObject {
    
    public var params =  [String: [String: String]]()
    private let defaultGroupName = "Wibmo3ds"
    
    public override init() {
        params[defaultGroupName] = [String: String]()
    }
    
    public func addParam(_ group: String?, _ paramName: String?, _ paramValue: String?) throws {
        guard let paramName = paramName else {
            throw InvalidInputException(message: "paramName can not be nil", cause: nil)
        }
        
        let paramVal = paramValue ?? ""
        
        if let groupName = group {
            params[groupName]?[paramName] =  paramVal
        } else {
            params[defaultGroupName]?[paramName] = paramVal
        }
    }
    
    public func getParamValue(_ group: String?, _ paramName: String?) throws -> String? {
        guard let paramName = paramName else {
            throw InvalidInputException(message: "paramName can not be nil", cause: nil)
        }
        
        if let groupName = group {
            return params[groupName]?[paramName]
        } else {
            return params[defaultGroupName]?[paramName]
        }
        
    }
    
    public func removeParam(_ group: String?, _ paramName: String?) throws -> String? {
        guard let paramName = paramName else {
            throw InvalidInputException(message: "paramName can not be nil", cause: nil)
        }
        
        if let groupName = group,  let groupParams = params[groupName], let _ = groupParams[paramName] {
            params[groupName]?[paramName] = nil
            return paramName
        } else if let groupParams = params[defaultGroupName], let _ = groupParams[paramName] {
            params[defaultGroupName]?[paramName] = nil
            return paramName
        } else {
            return nil
        }
    }
}
