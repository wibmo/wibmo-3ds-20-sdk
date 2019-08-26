//
//  ThreeDS2Service.swift
//  Wibmo3ds
//
//  Created by neeraj goyal on 15/02/18.
//

import Foundation

/// The ThreeDS2Service interface is the main 3DS SDK interface.
///
/// It provides methods to process transactions.
@objc public protocol ThreeDS2Service {
    /// Initializes the 3DS SDK instance.
   @objc func initialize(_ application: UIApplication?, _ configParameters: ConfigParameters?, _ locale: String?, _ uiCustomization: UiCustomization?) throws
    
    /// Creates an instance of Transaction through which the 3DS Requestor App gets the data that is required to perform the transaction.
   @objc func createTransaction(_ directoryServerID: String, _ messageVersion: String?) throws -> Transaction
    
    /// Frees up resources that are used by the 3DS Requestor App until it is closed. It shall be called only once during a single 3DS Requestor App session.
    @objc func cleanup() throws
    
    /// Returns the version of the 3DS SDK that is integrated with the 3DS Requestor App.
    @objc func getSDKVersion() throws -> String
    
    /// Returns warnings produced by the 3DS SDK while performing security checks during initialization.
    @objc func getWarnings() throws -> [Warning]
}
