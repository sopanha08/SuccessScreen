//
//  LoginPhoneViewModel.swift
//  sathapana-mobile-app
//
//  Created by Sovanndy Ul on 29/3/21.
//

import UIKit

enum LoginWithMobileIndexPath: Int, CaseIterable {
    case Header
    case PhoneNumber
    case Password
    case ForgetPassword
}

class LoginWithMobileViewModel: BaseViewModel {
    var allCases: Int {
        return LoginWithMobileIndexPath.allCases.count
    }
    
    func values(with activateMobileIndexPath: LoginWithMobileIndexPath) -> BaseViewModel {
        switch activateMobileIndexPath {
        case .Header:
            return TextFieldViewModel(with: TextFieldModel(placeHolder: "login_with_phone_title".localizedString,
                                                           value: "login_with_phone_description".localizedString,
                                                           imageName: "login_screen_welcome_back"), activateMobileIndexPath: .Header)
        case .PhoneNumber:
            return TextFieldViewModel(with: TextFieldModel(placeHolder: "placeholder_phone_number".localizedString,
                                                           imageName: "leading_phoneNumber"), activateMobileIndexPath: .PhoneNumber)
            
        case .Password:
            return TextFieldViewModel(with: TextFieldModel(placeHolder: "placeholder_choose_password".localizedString,
                                                           imageName: "leading_phoneNumber", isSecureTextEntry: true,
                                                           keyboardType: .default),
                                      activateMobileIndexPath: .AccountNumber)
        case .ForgetPassword:
            return TextFieldViewModel(with: TextFieldModel(placeHolder: "placeholder_phone_number".localizedString,
                                                           imageName: "leading_phoneNumber"))
        }
    }
}
