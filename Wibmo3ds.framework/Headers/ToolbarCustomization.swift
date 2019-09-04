//
//  ToolbarCustomization.swift
//  Wibmo3ds
//
//  Created by neeraj goyal on 15/02/18.
//

import Foundation

@objc public class ToolbarCustomization: Customization {
    
    @objc public var backgroundColor: String?
    @objc public var headerText: String?
    @objc public var buttonText: String?
    
    public init(backgroundColor: String? = nil, headerText: String? = nil, buttonText: String? = nil) throws {
        guard backgroundColor?.isHexString() == true else {
            throw InvalidInputException(message: "backgroundColor string is not of correct format. (eg: #123456)", cause: nil)
        }
        self.backgroundColor = backgroundColor
        self.headerText = headerText
        self.buttonText = buttonText
        do {
            try super.init()
        } catch {
            throw error
        }
    }
    
    public func setBackgroundColor(_ hexColorCode: String) throws {
        guard hexColorCode.isHexString() else {
            throw InvalidInputException(message: "hexColorCode string should be of format #123456.", cause: nil)
        }
        self.backgroundColor = hexColorCode
    }
    
    public func setHeaderText(_ headerText: String) throws {
        self.headerText = headerText
    }
    
    public func setButtonText(_ buttonText: String) throws {
        self.buttonText = buttonText
    }
    public func getBackgroundColor() -> String? {
        return self.backgroundColor
    }
    
    public func getHeaderText() -> String? {
        return self.headerText
    }
    
    public func getButtonText() -> String? {
        return self.buttonText
    }
}
