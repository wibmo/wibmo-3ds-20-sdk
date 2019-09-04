//
//  ButtonCustomization.swift
//  Wibmo3ds
//
//  Created by neeraj goyal on 15/02/18.
//

import Foundation

@objc public class ButtonCustomization: Customization {
    
    @objc public var backgroundColor: String?
    @objc public var cornerRadius: Int = 0
    
    @objc public init(backgroundColor: String?, cornerRadius: Int = 0) throws {
        guard backgroundColor?.isHexString() == true else {
            throw InvalidInputException(message: "backgroundColor string is not of correct format. (eg: #12345678)", cause: nil)
        }
        guard cornerRadius > 0 else {
            throw InvalidInputException(message: "cornerRadius can not be less then 0", cause: nil)
        }
        self.backgroundColor = backgroundColor
        self.cornerRadius = cornerRadius
        do {
            try super.init()
        } catch {
            throw error
        }
    }
    
    @objc public func setBackgroundColor(_ hexColorCode: String) throws {
        guard hexColorCode.isHexString() == true else {
            throw InvalidInputException(message: "hexColorCode string is not of correct format. (eg: #123456)", cause: nil)
        }
        self.backgroundColor = hexColorCode
    }
    
    @objc public func setCornerRadius(_ cornerRadius: Int) throws {
        guard cornerRadius > 0 else {
            throw InvalidInputException(message: "cornerRadius can not be less then 0", cause: nil)
        }
        self.cornerRadius = cornerRadius
    }
    
    @objc public func getBackgroundColor() -> String? {
        return backgroundColor
    }
    
    @objc public func getCornerRadius() -> Int {
        return cornerRadius
    }
}
