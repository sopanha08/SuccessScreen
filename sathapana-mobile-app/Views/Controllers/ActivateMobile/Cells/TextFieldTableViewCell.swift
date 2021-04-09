//
//  TextFieldTableViewCell.swift
//  sathapana-mobile-app
//
//  Created by Sovanndy Ul on 24/3/21.
//

import UIKit
import MaterialComponents.MaterialTextControls_OutlinedTextFields

protocol TextFieldTableViewCellDelgate: NSObject {
    func didUpdateTextField(with string: String,
                            activateMobileIndexPath: ActivateMobileIndexPath)
}

class TextFieldTableViewCell: UITableViewCell, CellProtocol {
    @IBOutlet weak var textField: MDCOutlinedTextField!
    
    weak var delegate: TextFieldTableViewCellDelgate?
    
    var vm: TextFieldViewModel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    func configCell(with viewModel: BaseViewModel) {
        vm = viewModel as? TextFieldViewModel
        
        textField.label.text = vm.placeHolder
        textField.text = vm.value
        textField.isSecureTextEntry = vm.isSecureTextEntry
        textField.leadingView = UIImageView(image: vm.image)
        textField.keyboardType = vm.keyboardType
    }
    
    private func setupView() {
        selectionStyle = .none
        textField.autocorrectionType = .yes
        textField.autocorrectionType = .no
        if #available(iOS 12.0, *) {
            textField.textContentType = .oneTimeCode
        }
        
        textField.delegate = self
        textField.setOutlineColor(.init(hexString: "#797976"), for: .normal)
        textField.setOutlineColor(.init(hexString: "#3B97D3"), for: .editing)
        textField.setFloatingLabelColor(.init(hexString: "#3B97D3"), for: .editing)
        textField.keyboardType = .numberPad
        textField.leadingViewMode = .always
        textField.sizeToFit()
    }
}

extension TextFieldTableViewCell: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        delegate?.didUpdateTextField(with: string,
                                     activateMobileIndexPath: vm.activateMobileIndexPath)
        return true
    }
}
