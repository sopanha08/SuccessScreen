//
//  EnterPinViewController.swift
//  sathapana-mobile-app
//
//  Created by Sok Khoinsreng on 3/30/21.
//

import UIKit

class EnterPinViewController: BaseViewController {

    @IBOutlet weak var headerView: ContentHeaderView! {
        didSet {
            headerView.headerTitleLabel.text = "enter_pin_title".localizedString
            headerView.headerDetailLabel.text = "enter_pin_description".localizedString
            headerView.headerImageView.image = UIImage(named: "enter_app_pin")
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
extension EnterPinViewController: PinDelegate {
    func summitPinCode(pinCode: String) {
        
        let vc = ConfirmPinViewViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func scanBiometric() {
        print("Scan")
    }
    
    
}
