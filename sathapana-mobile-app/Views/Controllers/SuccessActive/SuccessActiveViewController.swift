//
//  SuccessActiveViewController.swift
//  sathapana-mobile-app
//
//  Created by Sok Khoinsreng on 3/30/21.
//

import UIKit

class SuccessActiveViewController: BaseViewController {

    @IBOutlet weak var headerView: SuccessActiveView! {
        didSet {
            headerView.titleLabel.text = "success_title".localizedString
            headerView.detailLabel.text = "success_description".localizedString
        }
    }
    
    @IBOutlet weak var loginWithPinButton: CustomButton! {
        didSet {
            loginWithPinButton.setTitle("login_with_pin_button".localizedString, for: .normal)
        }
    }
    
    @IBOutlet weak var loginWIthFaceIdButton: CustomButton! {
        didSet {
            loginWIthFaceIdButton.setTitle("login_with_faceID_button".localizedString, for: .normal)
        }
    }
    
    
    lazy var biometricUtils: BiometricUtils = { [unowned self] in
          let vc = BiometricUtils()
          return vc
      }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func onLoginPin(_ sender: Any) {
        let vc = LoginPinViewController()
        navigationController?.pushViewController(vc, animated: false)
    }
    
    @IBAction func onLoginFaceID(_ sender: Any) {
        biometricUtils.authenticateUser { (status) in
            if status {
                print("Success Scan")
            }
        }
    }
}
