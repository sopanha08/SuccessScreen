//
//  LoginPinViewController.swift
//  sathapana-mobile-app
//
//  Created by Sok Khoinsreng on 4/1/21.
//

import UIKit

class LoginPinViewController: BaseViewController {

    
    @IBOutlet weak var enterPinCodeLabel: UILabel! {
        didSet {
            enterPinCodeLabel.text = "enter_pin_code_label".localizedString
        }
    }
    @IBOutlet weak var cannotLoginButton: UIButton! {
        didSet{
            cannotLoginButton.setTitle("cannot_login_button".localizedString, for: .normal)
        }
    }
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    @IBOutlet weak var pinView: PinView! {
        didSet {
            pinView.isHideCode = true
            pinView.isCustomKeyboard = true
            pinView.isPresent = true
        }
    }
    
    lazy var biometricUtils: BiometricUtils = { [unowned self] in
        let vc = BiometricUtils()
        return vc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pinView.delegate = self
        
    }
    
    @IBAction func keyTapped(sender: UIButton) {
        // When a button is tapped, send that information to the
        //        self.delegate?.numPadTapped(character: sender.titleLabel!.text!) // could alternatively send a tag value
        self.pinView.numberTap(character: sender.titleLabel!.text!)
    }
    
    @IBAction func didTapDelete(_ sender: Any) {
        self.pinView.numberDelete()
    }
    
    @IBAction func didTapScan(_ sender: Any) {
        biometricUtils.authenticateUser { (status) in
            if status {
                self.pinView.pinTextField.text = "●●●●●●"
                self.pinView.setPinTextField(character: self.pinView.pinTextField.text ?? "")
            }
        }
    }
    @IBAction func didTapCannotLogin(_ sender: Any) {
        let vc = ForgetPasswordViewController()
        vc.viewModel = ForgetPasswordViewModel()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func didTapCross(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

extension LoginPinViewController: PinDelegate {
    func summitPinCode(pinCode: String) {
        print("Summit Code \(pinCode)")
    }
    
    func scanBiometric() {
        print("Scan")
    }
}
