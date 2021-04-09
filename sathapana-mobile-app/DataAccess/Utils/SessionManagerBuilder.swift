//
//  SessionManagerBuilder.swift
//  sathapana-mobile-app
//
//  Created by Sovanndy Ul on 23/3/21.
//

import Alamofire

class SessionManagerBuilder {
    // Create the server trust policies
    static var Manager: Session = {
        // Create custom manager
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = TimeInterval(120)
        let manager = Session(
            configuration: configuration,
            serverTrustManager: ServerTrustManager(allHostsMustBeEvaluated: false, evaluators: [:])
        )
        return manager
    }()
}
