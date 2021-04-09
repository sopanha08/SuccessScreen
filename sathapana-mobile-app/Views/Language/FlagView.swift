//
//  FlagView.swift
//  sathapana-mobile-app
//
//  Created by Sovanndy Ul on 25/3/21.
//

import UIKit

class FlagView: UIView, NibLoadableView {    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - View Cycles
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadNib()
    }
}
