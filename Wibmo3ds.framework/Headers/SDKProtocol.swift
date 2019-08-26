//
//  SDKProtocol.swift
//  Wibmo3ds
//
//  Created by Sushil Sahoo on 10/09/18.
//

import Foundation
import UIKit

@objc public protocol GenericChallengeProtocol {
    
    func clickVerifyButton()
    
    func getChallengeType() -> String
    
    func clickCancelButton()
    
    func setChallengeProtocol(sdkChallengeProtocol: SDKChallengeProtocol)
    
    /**
     * <p> Callback to notify the SDK to expand all text areas before RefApp takes a screenshot
     * for Visual Test Cases. </p>
     * **/
    func expandTextsBeforeScreenshot()
}

@objc public protocol MultiSelectChallengeProtocol : GenericChallengeProtocol {
    

     func selectIndex(_ index: Int)
}

@objc public protocol OutOfBandChallengeProtocol : GenericChallengeProtocol {
}

@objc public protocol SDKChallengeProtocol {
    
     func handleChallenge()
}

@objc public protocol SingleSelectorChallengeProtocol : GenericChallengeProtocol {

     func selectObject(_ index: Int)
}

@objc public protocol TextChallengeProtocol : GenericChallengeProtocol {
    

     func typeTextChallengeValue(_ value: String)
}

@objc public protocol WebChallengeProtocol : GenericChallengeProtocol {

     func getWebView() -> UIWebView
}
