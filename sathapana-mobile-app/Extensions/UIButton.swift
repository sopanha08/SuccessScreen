//
//  UIButton.swift
//  sathapana-mobile-app
//
//  Created by Sok Khoinsreng on 3/30/21.
//

import UIKit

extension UIButton {
    func centerTextAndImage(spacing: CGFloat) {
        let insetAmount = spacing
        
        imageEdgeInsets = UIEdgeInsets(top: 0, left: insetAmount, bottom: 0, right: 0)
        titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func defaultShadow() {
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 5.0
        self.layer.masksToBounds = false
    }
}

