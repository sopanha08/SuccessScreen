//
//  ForgetPasswordViewModel.swift
//  sathapana-mobile-app
//
//  Created by Sok Khoinsreng on 3/31/21.
//

import UIKit

enum ForgetPasswordIndexPath: Int, CaseIterable {
    case Header
    case PhoneNumber
    case AccountNumber
}

class ForgetPasswordViewModel: BaseViewModel {
    var allCases: Int {
        return ForgetPasswordIndexPath.allCases.count
    }
    
    func values(with forgetPasswordIndexPath: ForgetPasswordIndexPath) -> BaseViewModel {
        switch forgetPasswordIndexPath {
        case .Header:
            return TextFieldViewModel(with: TextFieldModel(placeHolder: "forget_password_title".localizedString,
                                                           value: "forget_paassword_description".localizedString,
                                                           imageName: "login_screen_welcome_back"), activateMobileIndexPath: .Header)
        case .PhoneNumber:
            return TextFieldViewModel(with: TextFieldModel(placeHolder: "placeholder_phone_number".localizedString,
                                                           imageName: "leading_phoneNumber"), activateMobileIndexPath: .PhoneNumber)
            
        case .AccountNumber:
            return TextFieldViewModel(with: TextFieldModel(placeHolder: "placeholder_account_number".localizedString,
                                                           imageName: "user_place_holder",
                                                           keyboardType: .default),
                                      activateMobileIndexPath: .AccountNumber)
        }
    }
}
