//
//  SuccessPayBillsViewController.swift
//  sathapana-mobile-app
//
//  Created by Rith Sopanha on 9/4/21.
//

import UIKit

class SuccessPayBillsViewController: BaseViewController {
    
    
    @IBOutlet weak var headerView: SuccessPayBillsView! {
        didSet {
            headerView.titleLabel.text = "EDC PHNOM PENH PAY SUCCESS".localizedString
            headerView.currencyLabel.text = "KHR 14,000.00".localizedString
        }
    }
    @IBOutlet weak var viewTransactionDetail: CustomButton! {
        didSet {
            viewTransactionDetail.setTitle("VIEW TRANSACTION DETAIL".localizedString, for: .normal)
        }
    }
    
    @IBOutlet weak var gotoHomeScreen: CustomButton! {
        didSet {
            gotoHomeScreen.setTitle("HOME".localizedString, for: .normal)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func viewTransaction(_ sender: Any) {
        debugPrint("View Transaction")
    }
    
    @IBAction func goHome(_ sender: Any) {
        debugPrint("Go Home")
    }
    
}
