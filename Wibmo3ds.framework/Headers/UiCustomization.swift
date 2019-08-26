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
    
    private var btnCustomizations: Dictionary<String, ButtonCustomization>?
    private var tbrCustomization: ToolbarCustomization?
    private var lblCustomization: LabelCustomization?
    private var txtBxCustomization: TextBoxCustomization?
    
    public init(_ btnCustomizations: Dictionary<String, ButtonCustomization>? = nil,
                _ tbrCustomization: ToolbarCustomization? = nil,
                _ lblCustomization: LabelCustomization? = nil,
                _ txtBxCustomization: TextBoxCustomization? = nil
        ) {
        self.btnCustomizations = btnCustomizations
        self.tbrCustomization = tbrCustomization
        self.lblCustomization = lblCustomization
        self.txtBxCustomization = txtBxCustomization
    }
    
    public enum ButtonType: String {
        case VERIFY = "Verify"
        case CONTINUE = "Continue"
        case NEXT = "Next"
        case CANCEL = "Cancel"
        case RESEND = "Resend"
    }
    
    /// Sets the attributes of a ButtonCustomization object for an implementer-specific button type.
    public func setButtonCustomization(_ buttonCustomization: ButtonCustomization, _ buttonType: ButtonType) throws {
        if btnCustomizations == nil {
            btnCustomizations = Dictionary<String, ButtonCustomization>()
        }
        btnCustomizations![buttonType.rawValue] = buttonCustomization
    }
    
    /// Sets the attributes of a ToolbarCustomization object.
    public func setToolbarCustomization(_ toolbarCustomization: ToolbarCustomization) throws {
        self.tbrCustomization = toolbarCustomization
    }
    
    /// Sets the attributes of a LabelCustomization object.
    public func setLabelCustomization(_ labelCustomization: LabelCustomization) throws {
        self.lblCustomization = labelCustomization
    }
    
    /// Sets the attributes of a TextBoxCustomization object.
    public func setTextBoxCustomization(_ textBoxCustomization: TextBoxCustomization) throws {
        self.txtBxCustomization = textBoxCustomization
    }
    
    /// Returns a ButtonCustomization object.
    public func getButtonCustomization(_ buttonType: ButtonType) throws -> ButtonCustomization? {
        if btnCustomizations == nil {
            return nil
        } else {
            return btnCustomizations![buttonType.rawValue]
        }
    }
    
    /// Returns a ToolbarCustomization object.
    public func getToolbarCustomization() -> ToolbarCustomization? {
        return tbrCustomization
    }
    
    /// Returns a LabelCustomization object.
    public func getLabelCustomization() -> LabelCustomization? {
        return lblCustomization
    }
    
    /// Returns a TextBoxCustomization object.
    public func getTextBoxCustomization() -> TextBoxCustomization? {
        return txtBxCustomization
    }
}
