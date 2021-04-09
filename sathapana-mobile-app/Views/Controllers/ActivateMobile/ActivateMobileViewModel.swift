//
//  ActivateMobileViewModel.swift
//  sathapana-mobile-app
//
//  Created by Sovanndy Ul on 24/3/21.
//

import Foundation
import UIKit

class TextFieldModel {
    var placeHolder: String
    var value: String
    var imageName: String
    var isSecureTextEntry: Bool
    var keyboardType: UIKeyboardType
    
    init(placeHolder: String = "",
         value: String = "",
         imageName: String,
         isSecureTextEntry: Bool = false,
         keyboardType: UIKeyboardType = .numberPad) {
        self.placeHolder = placeHolder
        self.value = value
        self.imageName = imageName
        self.isSecureTextEntry = isSecureTextEntry
        self.keyboardType = keyboardType
    }
}

class TextFieldViewModel: BaseViewModel {
    let textFieldModel: TextFieldModel
    let activateMobileIndexPath: ActivateMobileIndexPath
    
    init(with textFieldModel: TextFieldModel,
         activateMobileIndexPath: ActivateMobileIndexPath = .AccountNumber) {
        self.textFieldModel = textFieldModel
        self.activateMobileIndexPath = activateMobileIndexPath
    }
    
    var image: UIImage {
        return UIImage(named: textFieldModel.imageName)!
    }
    
    var value: String {
        return textFieldModel.value
    }
    
    var placeHolder: String {
        return textFieldModel.placeHolder
    }
    
    var isSecureTextEntry: Bool {
        return textFieldModel.isSecureTextEntry
    }
    
    var keyboardType: UIKeyboardType {
        return textFieldModel.keyboardType
    }
}

enum ActivateMobileIndexPath: Int, CaseIterable {
    case Header
    case PhoneNumber
    case AccountNumber
    case DateOfBirth
    case TermCondition
}

class ActivateMobileViewModel: BaseViewModel {
    var allCases: Int {
        return ActivateMobileIndexPath.allCases.count
    }
    
    func values(with activateMobileIndexPath: ActivateMobileIndexPath) -> BaseViewModel {
        switch activateMobileIndexPath {
        case .Header:
            return TextFieldViewModel(with: TextFieldModel(placeHolder: "activate_mobile_app_title".localizedString,
                                                           value: "activate_mobile_app_description".localizedString,
                                                           imageName: "activate_phone_number"), activateMobileIndexPath: .Header)
        case .PhoneNumber:
            return TextFieldViewModel(with: TextFieldModel(placeHolder: "placeholder_phone_number".localizedString,
                                                           imageName: "leading_phoneNumber"), activateMobileIndexPath: .PhoneNumber)
            
        case .AccountNumber:
            return TextFieldViewModel(with: TextFieldModel(placeHolder: "placeholder_account_number".localizedString,
                                                           imageName: "user_place_holder"), activateMobileIndexPath: .AccountNumber)
            
        case .DateOfBirth:
            return TextFieldViewModel(with: TextFieldModel(placeHolder: "placeholder_date_of_birth".localizedString,
                                                           imageName: "user_place_holder_calendar"), activateMobileIndexPath: .DateOfBirth)
        case .TermCondition:
            return TextFieldViewModel(with: TextFieldModel(value: "accept_term_conditions".localizedString,
                                                           imageName: "leading_phoneNumber"), activateMobileIndexPath: .TermCondition)
        }
    }
}
