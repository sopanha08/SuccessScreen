//
//  UILabel+SPNLabel.swift
//  sathapana-mobile-app
//
//  Created by Sovanndy Ul on 26/3/21.
//

import UIKit

extension UILabel {
    func setTextWithLineSpacing(text: String,
                                lineHeightMultiply: CGFloat = 1.3,
                                alignment: NSTextAlignment = .center) {
        
        
        let attributeString = NSMutableAttributedString(string: text)
        let style = NSMutableParagraphStyle()
        style.alignment = alignment

        style.lineSpacing = lineHeightMultiply
        attributeString.addAttribute(NSAttributedString.Key.paragraphStyle,
                                     value: style,
                                     range: NSMakeRange(0, text.count))
        
        attributedText = attributeString
    }
}
