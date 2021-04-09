//
//  KeyboardHelper.swift
//  sathapana-mobile-app
//
//  Created by Sreng125 on 3/24/21.
//

import Foundation
import UIKit

class KeyboardHelper{
    
    public static let shared = KeyboardHelper()
    
    public func setTextFromKeyboard(textfield: UITextField, character: String) {
        guard let accountNumber = textfield.text else { return }
        let text = accountNumber + character
        textfield.text = text
    }
    
    public func deleteTextFromKeyboard(textfield: UITextField) {
        if !(textfield.text?.isEmpty ?? true) {
            guard var accountNumber = textfield.text else { return }
            let lastIndex = accountNumber.index(before: accountNumber.endIndex)
            accountNumber.remove(at: lastIndex)
            textfield.text = accountNumber
        }
    }
    
    public func removeLastIndexString( string: inout String) {
        if string.count > 0 {
            let lastIndex = string.index(before: string.endIndex)
            string.remove(at: lastIndex)
        }
    }
}
