//
//  Customization.swift
//  Wibmo3ds
//
//  Created by neeraj goyal on 15/02/18.
//

import Foundation

@objc public class Customization : NSObject {
    
    private var txtFontName: String = UIFont.systemFont(ofSize: UIFont.systemFontSize).fontName
    private var txtColor: String?
    private var txtFontSize: Int = Int(UIFont.systemFontSize)
    
    public init(_ txtFontName: String = UIFont.systemFont(ofSize: UIFont.systemFontSize).fontName,
                _ txtColor: String? = nil,
                _ txtFontSize: Int = Int(UIFont.systemFontSize)) throws {
        guard txtFontSize > 0 else {
            throw InvalidInputException(message: "txtFontSize can not be less than 0", cause: nil)
        }
        
        guard let _ = UIFont(name: txtFontName, size: CGFloat(txtFontSize)) else {
            throw InvalidInputException(message: "Font with <\(txtFontName)> not supported.", cause: nil)
        }
        
        if let textColor = txtColor {
            guard textColor.isHexString() else {
                throw InvalidInputException(message: "txtColor string should be of format #123456.", cause: nil)
            }
        }
        self.txtFontSize = txtFontSize
        self.txtColor = txtColor
        self.txtFontName = txtFontName
    }
    
    public func setTextFontName(_ fontName: String) throws {
        guard let _ = UIFont(name: fontName, size: UIFont.systemFontSize) else {
            throw InvalidInputException(message: "Font with <\(fontName)> not supported.", cause: nil)
        }
        self.txtFontName = fontName
    }
    
    public func setTextColor(_ hexColorCode: String) throws {
        guard hexColorCode.isHexString() else {
            throw InvalidInputException(message: "hexColorCode string should be of format #123456.", cause: nil)
        }
        self.txtColor = hexColorCode
    }
    
    public func setTextFontSize(_ fontSize: Int) throws {
        guard fontSize > 0 else {
            throw InvalidInputException(message: "txtFontSize can not be less than 0", cause: nil)
        }
        self.txtFontSize = fontSize
    }
    
    public func getTextFontName() -> String {
        return txtFontName
    }
    
    public func getTextColor() -> String? {
        return txtColor
    }
    
    public func getTextFontSize() -> Int {
        return txtFontSize
    }
}

