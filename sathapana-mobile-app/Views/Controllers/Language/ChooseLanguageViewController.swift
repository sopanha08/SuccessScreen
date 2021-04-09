//
//  ChooseLanguageViewController.swift
//  sathapana-mobile-app
//
//  Created by Sovanndy Ul on 22/3/21.
//

import UIKit

class ChooseLanguageViewController: BaseViewController {
    @IBOutlet weak var languageView: ChooseLanguageView!
    
    // MARK: - View Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        languageView.delegate = self
    }
}

extension ChooseLanguageViewController: ChooseLanguageViewDelegate {
    func didClickLanguage(with language: Language) {
        let storage = Storage()
        storage.setLanguage(with: language)
        
//        let vc = LoginViewController()
//        navigationController?.pushViewController(vc, animated: false)
        let vc = OnboardingViewController()
        navigationController?.pushViewController(vc, animated: false)
        
        
    }
}
