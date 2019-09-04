//
//  TextBoxCustomization.swift
//  Wibmo3ds
//
//  Created by neeraj goyal on 15/02/18.
//

import Foundation

@objc public class TextBoxCustomization: Customization {
    
    private var borderWidth: Int = 0
    private var cornerRadius: Int = 0
    private var borderColor: String?
    
    
   @objc public init(borderWidth: Int = 0, cornerRadius: Int = 0, borderColor: String? = nil) throws {
        guard borderWidth > 0 else {
            throw InvalidInputException(message: "borderWidth can not be less than 0", cause: nil)
        }
        
        guard cornerRadius > 0 else {
            throw InvalidInputException(message: "cornerRadius can not be less than 0", cause: nil)
        }
        
        if let bdrColor = borderColor {
            guard bdrColor.isHexString() else {
                throw InvalidInputException(message: "borderColor string should be of format #123456.", cause: nil)
            }
        }
        
        self.borderWidth = borderWidth
        self.borderColor = borderColor
        self.cornerRadius = cornerRadius
        do {
            try super.init()
        } catch {
            throw error
        }
    }
    
   @objc public func setBorderWidth(_ borderWidth: Int) throws {
        guard borderWidth > 0 else {
            throw InvalidInputException(message: "borderWidth can not be less than 0", cause: nil)
        }
        self.borderWidth = borderWidth
    }
    
   @objc public func getBorderWidth() -> Int {
        return borderWidth
    }
    
   @objc public func setBorderColor(_ hexColorCode: String) throws {
        guard hexColorCode.isHexString() else {
            throw InvalidInputException(message: "hexColorCode string should be of format #123456.", cause: nil)
        }
        self.borderColor = hexColorCode
    }
    
    @objc public func getBorderColor() -> String? {
        return borderColor
    }
    
    @objc public func setCornerRadius(_ cornerRadius: Int) throws {
        guard cornerRadius > 0 else {
            throw InvalidInputException(message: "cornerRadius can not be less than 0", cause: nil)
        }
        self.cornerRadius = cornerRadius
    }
    
    @objc public func getCornerRadius() -> Int {
        return cornerRadius
    }
}
