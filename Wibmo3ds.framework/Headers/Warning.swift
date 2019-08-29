//
//  Warning.swift
//  Wibmo3ds
//
//  Created by neeraj goyal on 15/02/18.
//

import Foundation

@objc public class Warning : NSObject {
    
    @objc public enum Severity: Int {
        case LOW
        case MEDIUM
        case HIGH
    }
    
    public enum WarnReason: String {
        case SW01
        case SW02
        case SW03
        case SW04
        case SW05
    }
    
    public var id: String
    public var message: String
    public var severity: Severity
    
    
    @objc public init(id: String, message: String, severity: Severity) {
        self.id = id
        self.message = message
        self.severity = severity
    }
    
    @objc public func getID() -> String {
        return id
    }
    
    @objc public func getMessage() -> String {
        return message
    }
    
    @objc public func getSeverity() -> Severity {
        return severity
    }
    
}

extension Warning {
    convenience init(warn: DeviceInfo.SWarning) {
        switch warn {
        case .SW01, .SW02, .SW03, .SW04, .SW05 :
            self.init(id: warn.id, message: warn.message, severity: warn.severity)
        }
    }
}
