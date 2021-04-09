//
//  CustomButton.swift
//  sathapana-mobile-app
//
//  Created by Sok Khoinsreng on 3/30/21.
//

import Foundation
import UIKit

enum themeColor: String {
    case white = "White"
    case blue = "Blue"
}

@IBDesignable
class CustomButton: UIButton {
    
    /// SwifterSwift: Image of normal state for button; also inspectable from Storyboard.
    @IBInspectable
    var imageForNormal: UIImage? {
        get {
            return image(for: .normal)
        }
        set {
            setImage(newValue, for: .normal)
        }
    }
    
    /// SwifterSwift: Title of normal state for button; also inspectable from Storyboard.
    @IBInspectable
    var titleForNormal: String? {
        get {
            return title(for: .normal)
        }
        set {
            setTitle(newValue, for: .normal)
        }
    }
    
    @IBInspectable
    var isWhite: Bool = false {
        didSet {
            self.updateUI(isWhite: isWhite)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.contentHorizontalAlignment = .left
        self.defaultShadow()
        centerTextAndImage(spacing: UIScreen.main.bounds.width - 105)
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        centerTextAndImage(spacing: UIScreen.main.bounds.width - 105)
    }
        
    private func updateUI(isWhite: Bool) {
        if isWhite {
            setBackgroundImage(#imageLiteral(resourceName: "backgroundButton"), for: .normal)
            self.setTitleColor(UIColor(hexString: "#0066AB"), for: .normal)
            
        } else {
            self.setTitleColor(.white, for: .normal)
            tintColor = .white
            setBackgroundImage(#imageLiteral(resourceName: "backgroundBlue"), for: .normal)
        }
    }
}
