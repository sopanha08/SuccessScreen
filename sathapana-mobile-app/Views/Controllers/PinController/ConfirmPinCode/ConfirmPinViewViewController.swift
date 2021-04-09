//
//  ConfirmPinViewViewController.swift
//  sathapana-mobile-app
//
//  Created by Sok Khoinsreng on 3/30/21.
//

import UIKit

class ConfirmPinViewViewController: BaseViewController {

    @IBOutlet weak var headerView: ContentHeaderView! {
        didSet {
            headerView.headerTitleLabel.text = "confirm_pin_title".localizedString
            headerView.headerDetailLabel.text = "confirm_pin_description".localizedString
        }
    }
    @IBOutlet weak var pinView: PinView! {
        didSet {
            pinView.isHideCode = true
            pinView.isCustomKeyboard = true
            
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

extension ConfirmPinViewViewController: PinDelegate {
    func summitPinCode(pinCode: String) {
        print(pinCode)
        let vc = SuccessActiveViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func scanBiometric() {
        print("Scan")
    }
}
