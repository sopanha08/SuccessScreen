//
//  SuccessPayBillsView.swift
//  sathapana-mobile-app
//
//  Created by Rith Sopanha on 6/4/21.
//

import UIKit

class SuccessPayBillsView: UIView, NibLoadableView {
    
    @IBOutlet weak var successPayBillsImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadNib()

    }
}
