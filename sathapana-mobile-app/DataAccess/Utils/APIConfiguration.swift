//
//  APIConfiguration.swift
//  sathapana-mobile-app
//
//  Created by Sovanndy Ul on 23/3/21.
//

import Foundation

protocol APIConfiguration {
    var baseUrl: String { get set }
}

extension APIConfiguration {
    var baseUrl: String {
        guard let infoDictionary = Bundle.main.infoDictionary,
              let url = infoDictionary["baseUrl"] as? String else { return "" }
        return url
    }
}
