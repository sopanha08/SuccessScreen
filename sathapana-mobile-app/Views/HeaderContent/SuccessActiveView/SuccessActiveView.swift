//
//  SuccessActiveView.swift
//  sathapana-mobile-app
//
//  Created by Sok Khoinsreng on 3/25/21.
//

import UIKit

class SuccessActiveView: UIView, NibLoadableView {

    @IBOutlet weak var successImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadNib()
    }
    
    override func awakeFromNib() {
        setUI()
    }
}

extension SuccessActiveView {
    func setUI() {
        
    }
}
