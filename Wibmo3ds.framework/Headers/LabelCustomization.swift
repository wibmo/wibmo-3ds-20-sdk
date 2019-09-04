//
//  LabelCustomization.swift
//  Wibmo3ds
//
//  Created by neeraj goyal on 15/02/18.
//

import Foundation

@objc public class LabelCustomization: Customization {
    
    @objc public private(set) var headingTxtColor: String?
    @objc public private(set) var headingTxtFontName: String = UIFont.systemFont(ofSize: UIFont.systemFontSize).fontName
    @objc public private(set) var headingTxtFontSize: Int = Int(UIFont.systemFontSize)
    
    @objc override public init(txtFontName: String = UIFont.systemFont(ofSize: UIFont.systemFontSize).fontName, txtColor: String? = nil, txtFontSize: Int = Int(UIFont.systemFontSize)) throws {
        
        guard headingTxtFontSize > 0 else {
            throw InvalidInputException(message: "headingTxtFontSize can not be less than 0", cause: nil)
        }
        
        guard let _ = UIFont(name: txtFontName, size: CGFloat(txtFontSize)) else {
            throw InvalidInputException(message: "Font with <headingTxtFontName> not available.", cause: nil)
        }
        
        if let textColor = txtColor {
            guard textColor.isHexString() else {
                throw InvalidInputException(message: "headingTxtColor string should be of format #123456.", cause: nil)
            }
        }
        self.headingTxtFontSize = txtFontSize
        self.headingTxtColor = txtColor
        self.headingTxtFontName = txtFontName
        do {
            try super.init()
            
        } catch {
            throw error
        }
    
    }
    
//    convenience init(headingTxtFontName: String = UIFont.systemFont(ofSize: UIFont.systemFontSize).fontName,
//                headingTxtColor: String? = nil,
//                headingTxtFontSize: Int = Int(UIFont.systemFontSize)) throws {
//        guard headingTxtFontSize > 0 else {
//            throw InvalidInputException(message: "headingTxtFontSize can not be less than 0", cause: nil)
//        }
//
//        guard let _ = UIFont(name: headingTxtFontName, size: CGFloat(headingTxtFontSize)) else {
//            throw InvalidInputException(message: "Font with <headingTxtFontName> not available.", cause: nil)
//        }
//
//        if let textColor = headingTxtColor {
//            guard textColor.isHexString() else {
//                throw InvalidInputException(message: "headingTxtColor string should be of format #123456.", cause: nil)
//            }
//        }
//        self.headingTxtFontSize = headingTxtFontSize
//        self.headingTxtColor = headingTxtColor
//        self.headingTxtFontName = headingTxtFontName
//        do {
//            try super.init()
//
//        } catch {
//            throw error
//        }
//    }
    
    @objc public func setHeadingTextFontName(_ fontName: String) throws {
        guard let _ = UIFont(name: fontName, size: UIFont.systemFontSize) else {
            throw InvalidInputException(message: "Font with <\(fontName)> not available.", cause: nil)
        }
        self.headingTxtFontName = fontName
    }
    
    @objc public func setHeadingTextColor(_ hexColorCode: String) throws {
        guard hexColorCode.isHexString() else {
            throw InvalidInputException(message: "hexColorCode string should be of format #123456.", cause: nil)
        }
        self.headingTxtColor = hexColorCode
    }
    
    @objc public func setHeadingTextFontSize(_ fontSize: Int) throws {
        guard fontSize > 0 else {
            throw InvalidInputException(message: "txtFontSize can not be less than 0", cause: nil)
        }
        self.headingTxtFontSize = fontSize
    }
    
    @objc public func getHeadingTextFontName() -> String {
        return headingTxtFontName
    }
    
    @objc public func getHeadingTextColor() -> String? {
        return headingTxtColor
    }
    
    @objc public func getHeadingTextFontSize() -> Int {
        return headingTxtFontSize
    }
    

    func getHeadingTextFont() -> UIFont {
        if let font = UIFont(name: headingTxtFontName, size: CGFloat(headingTxtFontSize)) {
            return font
        } else {
            return UIFont.systemFont(ofSize: UIFont.systemFontSize)
        }
    }
    
    func getHeadingTextUiColor() -> UIColor {
        if let cl = headingTxtColor , let headingColor = UIColor.init(hexString: cl) {
            return headingColor
        } else {
            return UIColor.black
        }
    }
}
