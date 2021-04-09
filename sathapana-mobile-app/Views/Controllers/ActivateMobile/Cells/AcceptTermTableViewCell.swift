//
//  AcceptTermTableViewCell.swift
//  sathapana-mobile-app
//
//  Created by Sovanndy Ul on 24/3/21.
//

import UIKit

class AcceptTermTableViewCell: UITableViewCell, CellProtocol {
    @IBOutlet weak var acceptTermTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    func configCell(with viewModel: BaseViewModel) {
        guard let vm = viewModel as? TextFieldViewModel else { return }
        
        let paragraphStyle: NSMutableParagraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .left
        
        let fullAttributedString = NSMutableAttributedString()
        if let link = URL(string: "https://www.sathapana.com.kh/about-sathapana/csr/") {
            let string = vm.value
            let attributedLinkString = NSMutableAttributedString(string: string,
                                                                 attributes:[NSAttributedString.Key.link: link,
                                                                             .font: UIFont.systemFont(ofSize: 14.0, weight: .regular),
                                                                             NSAttributedString.Key.paragraphStyle : paragraphStyle])
            fullAttributedString.append(attributedLinkString)
        }
        
        acceptTermTextView.linkTextAttributes = [ .foregroundColor: UIColor.black,
                                                  .underlineStyle : NSUnderlineStyle.single.rawValue]
        
        acceptTermTextView.attributedText = fullAttributedString
    }
    
    private func setupView() {
        selectionStyle = .none
        acceptTermTextView.isUserInteractionEnabled = true
        acceptTermTextView.isEditable = false
    }
}
