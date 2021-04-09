//
//  PinViewController.swift
//  sathapana-mobile-app
//
//  Created by Sreng125 on 3/24/21.
//

import UIKit

class PinViewController: BaseViewController {

    var isFromRegistrationFlow = false
    
    @IBOutlet weak var headerView: ContentHeaderView! {
        didSet {
            headerView.headerTitleLabel.text = "otp_title".localizedString
            headerView.headerDetailLabel.text = "otp_description".localizedString + " 017 464 147"
            headerView.headerImageView.image = UIImage(named: "OTP_header")
        }
    }
    
    @IBOutlet weak var pinView: PinView! {
        didSet {
            pinView.isHideCode = false
            pinView.isCustomKeyboard = false
            
        }
    }
    @IBOutlet weak var receiveCodeLabel: UILabel! {
        didSet{
            receiveCodeLabel.text = "receive_code_label".localizedString
        }
    }
    @IBOutlet weak var resendButton: UIButton! {
        didSet {
            resendButton.setTitle("resend_button".localizedString, for: .normal)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBackButton(with: true)

        pinView.delegate = self
        pinView.pinTextField.becomeFirstResponder()
        
        // Do any additional setup after loading the view.
    }

}

// MARK: Pin Delegate
extension PinViewController: PinDelegate {
    func summitPinCode(pinCode: String) {
        guard isFromRegistrationFlow else {
            let vc = EnterPinViewController()
            navigationController?.pushViewController(vc, animated: true)
            return
        }
        
        let vc = ScanNationIdViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func scanBiometric() {
        print("Scan")
    }
}
