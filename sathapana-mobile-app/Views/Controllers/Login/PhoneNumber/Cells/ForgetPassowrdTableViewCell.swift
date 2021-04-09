//
//  ForgetPassowrdTableViewCell.swift
//  sathapana-mobile-app
//
//  Created by Sovanndy Ul on 31/3/21.
//

import UIKit

protocol ForgetPassowrdTableViewCellDelegate: NSObjectProtocol {
    func forgetPasswordDidTap()
}

class ForgetPassowrdTableViewCell: UITableViewCell {
    @IBOutlet weak var button: UIButton!

    weak var delegate: ForgetPassowrdTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
        let paragraphStyle: NSMutableParagraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .left
        
        let yourAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 14.0, weight: .regular),
            .foregroundColor: UIColor(hexString: "0066AB"),
             .underlineStyle: NSUnderlineStyle.single.rawValue
         ]
        
        let attributeString = NSMutableAttributedString(
            string: "login_with_phone_forget_password".localizedString,
           attributes: yourAttributes
        )
        button.setAttributedTitle(attributeString, for: .normal)
    }
    
    @IBAction func forgetPasswordDidTap() {
        delegate?.forgetPasswordDidTap()
    }
}
