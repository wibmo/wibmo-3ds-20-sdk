//
//  Transaction.swift
//  Wibmo3ds
//
//  Created by neeraj goyal on 15/02/18.
//

import Foundation

/// An object that implements the Transaction interface shall hold
/// parameters that the 3DS Server requires to create AReq messages and to perform the Challenge Flow.

@objc public protocol Transaction {
    
    /// Returns device and 3DS SDK information to the 3DS Requestor App
    @objc func getAuthenticationRequestParameters() -> AuthenticationRequestParameters
    
    /// Initiates the challenge process.
    @objc func doChallenge(_ challengeParameters: ChallengeParameters, _ challengeStatusReceiver: ChallengeStatusReceiver, _ timeOut: Int) throws
    
    /// Returns an instance of Progress View (processing screen) that the 3DS Requestor App uses.
    @objc func getProgressView() throws -> ProgressDialog
    
    /// Cleans up resources that are held by the Transaction object.
    @objc func close()
}
