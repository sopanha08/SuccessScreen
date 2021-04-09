//
//  NewAccountViewModel.swift
//  sathapana-mobile-app
//
//  Created by Sovanndy Ul on 30/3/21.
//

import UIKit

enum NewAccountIndexPath: Int, CaseIterable {
    case Header
    case PhoneNumber
    case Term
}

class NewAccountViewModel: BaseViewModel {
    var allCases: Int {
        return NewAccountIndexPath.allCases.count
    }

    func values(with activateMobileIndexPath: NewAccountIndexPath) -> BaseViewModel {
        switch activateMobileIndexPath {
        case .Header:
            return TextFieldViewModel(with: TextFieldModel(placeHolder: "create_new_account_title".localizedString,
                                                           value: "create_new_account_description".localizedString,
                                                           imageName: "create_new_account_image"), activateMobileIndexPath: .Header)
        case .PhoneNumber:
            return TextFieldViewModel(with: TextFieldModel(placeHolder: "placeholder_phone_number".localizedString,
                                                           imageName: "leading_phoneNumber"), activateMobileIndexPath: .PhoneNumber)
            
        case .Term:
            return TextFieldViewModel(with: TextFieldModel(value: "accept_term_conditions".localizedString,
                                                           imageName: "leading_phoneNumber"), activateMobileIndexPath: .TermCondition)
        }
    }
}
