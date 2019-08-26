//
//  ProgressDialog.swift
//  Wibmo3ds
//
//  Created by neeraj goyal on 04/04/18.
//

import Foundation
import UIKit
import PKHUD

@objc public class ProgressDialog: PKHUDProgressView  {
    
    public convenience init() {
        self.init(title: nil, subtitle: nil)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public override init(title: String? = nil, subtitle: String? = nil) {
        super.init(title: title, subtitle: subtitle)
    }
    
    public func start() {
        HUD.show(.progress)        
    }
    
    public func stop() {
        HUD.hide()
        
    }
    
    public func showWithMessage(message:String){
        HUD.show(.label(message))
    }
}
