//
//  PinViewController.swift
//  sathapana-mobile-app
//
//  Created by Sreng125 on 3/24/21.
//

import UIKit

class PinViewController: UIViewController {

    @IBOutlet weak var pinView: PinView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pinView.pinTextField.becomeFirstResponder()
        
        // Do any additional setup after loading the view.
    }

}
