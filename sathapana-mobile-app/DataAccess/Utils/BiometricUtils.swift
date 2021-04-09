//
//  BiometricUtils.swift
//  sathapana-mobile-app
//
//  Created by Sok Khoinsreng on 3/30/21.
//

import UIKit
import LocalAuthentication

enum BiometricType {
    case none
    case touchID
    case faceID
    
    var rawValue: String {
        switch self {
        case .none:
            return ""
        case .touchID:
            return "one_touch_id"
        case .faceID:
            return "face_id"
        }
    }
}

class BiometricUtils {
    
    let context = LAContext()
    
    func canEvaluatePolicy() -> Bool {
        return context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)
    }
    
    func biometricType() -> BiometricType {
        let _ = context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)
        if #available(iOS 11.0, *) {
            switch context.biometryType {
            case .none:
                return .none
            case .touchID:
                return .touchID
            case .faceID:
                return .faceID
            default:
                return .none
            }
        } else {
            // Fallback on earlier versions
            return .none
        }
    }
    
    func authenticateUser(completion: @escaping (Bool) -> Void) {
        let loginReason = "authentication"
        
        guard canEvaluatePolicy() else {
            return
        }
        context.localizedFallbackTitle = ""
        context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics,
                               localizedReason: loginReason) { (success, evaluateError) in
            
            if success {
                DispatchQueue.main.async {
                    // User authenticated successfully, take appropriate action
                    completion(true)
                }
            } else {
                DispatchQueue.main.async {
                    // User authenticated successfully, take appropriate action
                    completion(false)
                }
            }
        }
    }
}
