//
//  NumbericPad.swift
//  sathapana-mobile-app
//
//  Created by Sreng125 on 3/24/21.
//

import UIKit

// The view controller will adopt this protocol (delegate)
// and thus must contain the keyWasTapped method
protocol KeyboardDelegate: class {
    func numPadTapped(character: String)
    func deletePadTapped()
    func scanTapped()
}

class NumbericPad: UIView {

    @IBOutlet weak var scanButton: UIButton!
    // This variable will be set as the view controller so that
    // the keyboard can send messages to the view controller.
    weak var delegate: KeyboardDelegate?
    
    var isScan: Bool = false
    // MARK:- keyboard initialization
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeSubviews()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeSubviews()
    }

    func initializeSubviews() {
        let xibFileName = "NumbericPad" // xib extention not included
        let view = Bundle.main.loadNibNamed(xibFileName, owner: self, options: nil)![0] as! UIView
        if isScan {
            scanButton.alpha = 1
        } else {
            scanButton.alpha = 0
        }
        self.addSubview(view)
        view.frame = self.bounds
    }

    // MARK:- Button actions from .xib file

    @IBAction func keyTapped(sender: UIButton) {
        // When a button is tapped, send that information to the
        // delegate (ie, the view controller)
        self.delegate?.numPadTapped(character: sender.titleLabel!.text!) // could alternatively send a tag value
    }

    @IBAction func deleteAction(_ sender: UIButton) {
        self.delegate?.deletePadTapped()
    }
    
    @IBAction func scanAction(_ sender: Any) {
        self.delegate?.scanTapped()
    }
}
