//
//  CameraButton.swift
//  sathapana-mobile-app
//
//  Created by Sovanndy Ul on 31/3/21.
//

import Foundation
import UIKit

@IBDesignable
class CameraButton: UIButton {
    
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
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.contentHorizontalAlignment = .left
        self.defaultShadow()
        setupView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    private func setupView() {
        centerTextAndImage(spacing: UIScreen.main.bounds.width - 105)
        tintColor = .clear
        backgroundColor = .clear
        layer.borderWidth = 1
        layer.borderColor = UIColor.white.cgColor
    }
}
