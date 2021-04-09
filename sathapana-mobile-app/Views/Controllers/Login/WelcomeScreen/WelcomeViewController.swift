//
//  WelcomeViewController.swift
//  sathapana-mobile-app
//
//  Created by Sovanndy Ul on 29/3/21.
//

import UIKit

class WelcomeViewController: BaseViewController {
    @IBOutlet weak var loginWithPhoneNumberButton :UIButton!
    @IBOutlet weak var activateButton :UIButton!
    @IBOutlet weak var createNewAccountButton :UIButton!
    
    // MARK: - View Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Private Methods
    private func setupView() {
        loginWithPhoneNumberButton.setTitleColor(.init(hexString: "0066AB"), for: .normal)
        loginWithPhoneNumberButton.setTitle("login_screen_button_login".localizedString, for: .normal)
        
        activateButton.setTitle("login_screen_button_activiation".localizedString, for: .normal)
        activateButton.setTitleColor(.init(hexString: "0066AB"), for: .normal)
        
        createNewAccountButton.setTitle("login_screen_button_create_new_account".localizedString, for: .normal)
        
        
    }
    
    // MARK: - Actions
    @IBAction func didTapLoginWithPhoneNumber() {
        let vc = LoginWithPhoneViewController()
        vc.viewModel = LoginWithMobileViewModel()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func didTapActivation() {
        let vc = ActivateMobileViewController()
        vc.viewModel = ActivateMobileViewModel()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func didTapCreateNewAccount() {
        let vc = CreateNewAccountViewController()
        vc.viewModel = NewAccountViewModel()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
