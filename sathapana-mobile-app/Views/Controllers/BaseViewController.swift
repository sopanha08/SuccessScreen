//
//  BaseViewController.swift
//  sathapana-mobile-app
//
//  Created by Sovanndy Ul on 23/3/21.
//

import UIKit

class BaseViewController: UIViewController {
    var nextButton: UIImageView!
    
    // MARK: - View Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerObserver()
    }
    
    // MARK: - Public Methods
    
    public func addBackButton(with isBlack: Bool = false) {
        //black_back_button
        let imageView = UIImageView()
        imageView.image = isBlack ? .blackBackButton : .spnBackButton
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .clear
        imageView.frame = CGRect(x: 20, y: 70, width: 20, height: 20)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                          action: #selector(backButtonDidTap))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tapGestureRecognizer)
        view.addSubview(imageView)
    }
    
    public func addNextButton() {
        let imageView = UIImageView()
        imageView.image = .nextButton
        imageView.backgroundColor = .clear
        imageView.frame = CGRect(x: view.frame.midX + 100, y: view.frame.maxY - 150, width: 84, height: 95)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                          action: #selector(nextButtonDidTap))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tapGestureRecognizer)
        nextButton = imageView
        view.addSubview(nextButton)
    }
    
    private func registerObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardDidHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    // MARK: - Actions
    @objc func backButtonDidTap() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func nextButtonDidTap() {}
    
    
    // MARK: - Keyboards
    
    @objc func keyBoardWillShow(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            UIView.animate(withDuration: 0.3) {
                if let nextButton = self.nextButton {
                    nextButton.frame.origin.y = (self.view.frame.maxY - 95) - keyboardSize.height
                }
            }
        }
    }
    
    @objc func keyBoardDidHide(notification: Notification) {
        UIView.animate(withDuration: 0.3) {
            if let nextButton = self.nextButton {
                nextButton.frame.origin.y = self.view.frame.maxY - 100
            }
        }
    }
}
