//
//  ContentHeaderView.swift
//  sathapana-mobile-app
//
//  Created by Sreng125 on 3/24/21.
//

import UIKit

class ContentHeaderView: UIView, NibLoadableView {
    
    @IBOutlet weak var headerImageView: UIImageView!
    @IBOutlet weak var headerTitleLabel: UILabel!
    @IBOutlet weak var headerDetailLabel: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadNib()
    }
    
    override func awakeFromNib() {
        setupUI()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        endEditing(true)
    }
}

extension ContentHeaderView {
    private func setupUI () {
        headerTitleLabel.textColor = .init(hexString: "#3B97D3")
    }
}
