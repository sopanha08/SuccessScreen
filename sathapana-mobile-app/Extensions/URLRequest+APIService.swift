//
//  URLRequest+APIService.swift
//  sathapana-mobile-app
//
//  Created by Sovanndy Ul on 23/3/21.
//

import UIKit
import Alamofire

extension URLRequest {
    public init?(baseURL: URL,
                 urlString: String,
                 method: Alamofire.HTTPMethod,
                 parameters: Parameters?) {
        self.init(url: URL(string: "\(baseURL.absoluteString)\(urlString)")!)
        
        setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        httpMethod = method.rawValue
        do {
            if let parameter = parameters as Any? {
                httpBody = try JSONSerialization.data(withJSONObject: parameter, options: .prettyPrinted)
            }
        } catch {
            debugPrint(error)
        }
    }
}

