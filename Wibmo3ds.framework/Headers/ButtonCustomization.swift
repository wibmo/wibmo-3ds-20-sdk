//
//  ButtonCustomization.swift
//  Wibmo3ds
//
//  Created by neeraj goyal on 15/02/18.
//

import Foundation

@objc public class ButtonCustomization: Customization {
    
    private var backgroundColor: String?
    private var cornerRadius: Int = 0
    
    public init(_ backgroundColor: String?, _ cornerRadius: Int = 0) throws {
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
    
    public func setBackgroundColor(_ hexColorCode: String) throws {
        guard hexColorCode.isHexString() == true else {
            throw InvalidInputException(message: "hexColorCode string is not of correct format. (eg: #123456)", cause: nil)
        }
        self.backgroundColor = hexColorCode
    }
    
    public func setCornerRadius(_ cornerRadius: Int) throws {
        guard cornerRadius > 0 else {
            throw InvalidInputException(message: "cornerRadius can not be less then 0", cause: nil)
        }
        self.cornerRadius = cornerRadius
    }
    
    public func getBackgroundColor() -> String? {
        return backgroundColor
    }
    
    public func getCornerRadius() -> Int {
        return cornerRadius
    }
}
