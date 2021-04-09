//
//  PersonalInformationViewModel.swift
//  sathapana-mobile-app
//
//  Created by Sovanndy Ul on 25/3/21.
//

import UIKit

enum PersonalInformationIndexPath: Int, CaseIterable {
    case Header
    case FullName
    case Gender
    case DateOfBirth
    case NibNumber
    case NibValidate
    case Email
}

class PersonalInformationViewModel: BaseViewModel {
    let scanResult: QKMRZScanResult?
    
    init(with scanResult: QKMRZScanResult? = nil) {
        self.scanResult = scanResult
    }
    
    var allCases: Int {
        return PersonalInformationIndexPath.allCases.count
    }
    
    func values(with activateMobileIndexPath: PersonalInformationIndexPath) -> BaseViewModel {
        switch activateMobileIndexPath {
        case .Header:
            return TextFieldViewModel(with: TextFieldModel(placeHolder: "personal_information_title".localizedString,
                                                           value: "personal_information_description".localizedString,
                                                           imageName: "personal_info"))
        case .FullName:
            return TextFieldViewModel(with: TextFieldModel(placeHolder: "placeholder_your_name".localizedString,
                                                           value: "\(fullName)",
                                                           imageName: "leading_phoneNumber"))
            
        case .DateOfBirth:
            return TextFieldViewModel(with: TextFieldModel(placeHolder: "placeholder_date_of_birth".localizedString,
                                                           value: "\(dateOfBirth)",
                                                           imageName: "leading_phoneNumber"))
            
        case .NibNumber:
            return TextFieldViewModel(with: TextFieldModel(placeHolder: "placeholder_nib_number".localizedString,
                                                           value: "\(documentNumber)",
                                                           imageName: "leading_phoneNumber"))
        case .NibValidate:
            return TextFieldViewModel(with: TextFieldModel(placeHolder: "placeholder_nib_expired_at".localizedString,
                                                           value: "\(nibNumber)",
                                                           imageName: "leading_phoneNumber"))
        case .Email:
            return TextFieldViewModel(with: TextFieldModel(placeHolder: "placeholder_email".localizedString,
                                                           imageName: "leading_phoneNumber"))
        case .Gender:
            return TextFieldViewModel(with: TextFieldModel(placeHolder: "placeholder_choose_gender".localizedString,
                                                           value: "\(getSex)",
                                                           imageName: "leading_phoneNumber"))
        }
    }
    
    var dateOfBirth: String {
        guard let scanResult = scanResult else { return "" }
        let birthDate = scanResult.birthDate!
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MMM-yyyy"
        let date = dateFormatter.string(from: birthDate)
        return date
    }
    
    var nibNumber: String {
        guard let scanResult = scanResult else { return "" }
        let documentNumber = scanResult.expiryDate
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MMM-yyyy"
        let date = dateFormatter.string(from: documentNumber!)
        return date
    }
    
    var fullName: String {
        guard let scanResult = scanResult else { return "" }
        return "\(scanResult.surnames) \(scanResult.givenNames)"
    }
    
    var documentNumber: String {
        guard let scanResult = scanResult else { return "" }
        return "\(scanResult.documentNumber)"
    }
    
    var getSex: String {
        guard let scanResult = scanResult else { return "" }
        return "\(String(describing: scanResult.sex))"
    }
}
