//
//  UiCustomization.swift
//  Wibmo3ds
//
//  Created by neeraj goyal on 15/02/18.
//

import Foundation


/// The UiCustomization class shall provide the functionality required
/// to customize the 3DS SDK UI elements. An object of this class holds various UI-related parameters

@objc public class UiCustomization : NSObject {
    
    private var btnCustomizations: Dictionary<String, ButtonCustomization>
    private var tbrCustomization: ToolbarCustomization
    private var lblCustomization: LabelCustomization
    private var txtBxCustomization: TextBoxCustomization
    
    @objc public init(_ btnCustomizations: Dictionary<String, ButtonCustomization> ,
                _ tbrCustomization: ToolbarCustomization,
                _ lblCustomization: LabelCustomization,
                _ txtBxCustomization: TextBoxCustomization
        ) {
        self.btnCustomizations = btnCustomizations
        self.tbrCustomization = tbrCustomization
        self.lblCustomization = lblCustomization
        self.txtBxCustomization = txtBxCustomization
    }
    
    @objc public enum ButtonTypeInt: Int {
        case VERIFY = 0
        case CONTINUE = 1
        case NEXT = 2
        case CANCEL = 3
        case RESEND = 4
    }
    
    public enum ButtonType: String {
        case VERIFY = "Verify"
        case CONTINUE = "Continue"
        case NEXT = "Next"
        case CANCEL = "Cancel"
        case RESEND = "Resend"
    }
    
    /// Sets the attributes of a ButtonCustomization object for an implementer-specific button type.
    @objc public func setButtonCustomization(_ buttonCustomization: ButtonCustomization, _ buttonType: ButtonTypeInt) throws {
        let btnType = self.buttonType(intType: buttonType)
        btnCustomizations[btnType.rawValue] = buttonCustomization
    }
    
    /// Sets the attributes of a ToolbarCustomization object.
    @objc public func setToolbarCustomization(_ toolbarCustomization: ToolbarCustomization) throws {
        self.tbrCustomization = toolbarCustomization
    }
    
    /// Sets the attributes of a LabelCustomization object.
    @objc public func setLabelCustomization(_ labelCustomization: LabelCustomization) throws {
        self.lblCustomization = labelCustomization
    }
    
    /// Sets the attributes of a TextBoxCustomization object.
    @objc public func setTextBoxCustomization(_ textBoxCustomization: TextBoxCustomization) throws {
        self.txtBxCustomization = textBoxCustomization
    }
    
    /// Returns a ButtonCustomization object.
    @objc public func getButtonCustomization(_ buttonType: ButtonTypeInt) throws -> ButtonCustomization {
        
        let btnType = self.buttonType(intType: buttonType)
        if let customization = btnCustomizations[btnType.rawValue] {
            return customization
        } else {
            throw InvalidInputException(message: "", cause: "")
        }
    }
    
    /// Returns a ToolbarCustomization object.
    @objc public func getToolbarCustomization() -> ToolbarCustomization {
        return tbrCustomization
    }
    
    /// Returns a LabelCustomization object.
    @objc public func getLabelCustomization() -> LabelCustomization {
        return lblCustomization
    }
    
    /// Returns a TextBoxCustomization object.
    @objc public func getTextBoxCustomization() -> TextBoxCustomization {
        return txtBxCustomization
    }
    
    private func buttonType(intType: ButtonTypeInt) -> ButtonType {
        switch intType {
        case .VERIFY:
            return ButtonType.VERIFY
        case .CONTINUE:
            return ButtonType.CONTINUE
        case .NEXT:
            return ButtonType.NEXT
        case .CANCEL:
            return ButtonType.CANCEL
        case .RESEND:
            return ButtonType.RESEND
        }
    }
}
