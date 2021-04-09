//
//  CheckBox.swift
//  sathapana-mobile-app
//
//  Created by Sovanndy Ul on 24/3/21.
//

import UIKit

@IBDesignable
final class CheckBox: UIButton {
    
    override func awakeFromNib() {
        addTarget(self,
                  action:#selector(buttonClicked(sender:)),
                  for: .touchUpInside)
        isChecked = true
    }
    
    @IBInspectable
    dynamic var checkedImage: UIImage? {
        didSet {
            setBackgroundImage(checkedImage, for: .normal)
        }
    }
    
    @IBInspectable
    dynamic var uncheckedImage: UIImage? {
        didSet {
            setBackgroundImage(uncheckedImage, for: .normal)
        }
    }
    
    var isChecked: Bool = true {
        didSet{
            if isChecked {
                setBackgroundImage(checkedImage, for: .normal)
            } else {
                setBackgroundImage(uncheckedImage, for: .normal)
            }
        }
    }
    
    @objc func buttonClicked(sender: UIButton) {
        isChecked = !isChecked
    }
}
