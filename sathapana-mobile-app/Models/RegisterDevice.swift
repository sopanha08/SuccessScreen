//
//  RegisterDevice.swift
//  sathapana-mobile-app
//
//  Created by Sovanndy Ul on 23/3/21.
//

import Foundation

// MARK: - RegisterDevice
struct RegisterDevice: Codable {
   let status, errorCode, errorMessage: String
   let device: Device

    private enum CodingKeys: String, CodingKey {
        case status
        case errorCode = "error_code"
        case errorMessage = "error_message"
        case device
    }
}

// MARK: - Device
struct Device: Codable {
    let deviceID: String

    enum CodingKeys: String, CodingKey {
        case deviceID = "device-id"
    }
}
