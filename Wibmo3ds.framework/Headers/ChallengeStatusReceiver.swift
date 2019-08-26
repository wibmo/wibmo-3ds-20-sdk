//
//  ChallengeStatusReceiver.swift
//  Wibmo3ds
//
//  Created by neeraj goyal on 15/02/18.
//

import Foundation

@objc public protocol ChallengeStatusReceiver {
    @objc func completed(_ e: CompletionEvent!)
    @objc func cancelled()
    @objc func timedout()
    @objc func protocolError(_ e: ProtocolErrorEvent!)
    @objc func runtimeError(_ e: RuntimeErrorEvent!)
}
