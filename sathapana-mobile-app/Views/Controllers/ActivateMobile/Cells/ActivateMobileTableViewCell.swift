//
//  ActivateMobileTableViewCell.swift
//  sathapana-mobile-app
//
//  Created by Sovanndy Ul on 23/3/21.
//

import UIKit

class ActivateMobileTableViewCell: UITableViewCell, CellProtocol {
    @IBOutlet weak var activateMobileHeaderView: ContentHeaderView!
    
    // MARK: - View Cycles
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    // MARK: - Actions
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        endEditing(true)
    }
    
    func configCell(with viewModel: BaseViewModel) {
        guard let vm = viewModel as? TextFieldViewModel else { return }
        
        activateMobileHeaderView.headerTitleLabel.text = vm.placeHolder
        activateMobileHeaderView.headerDetailLabel.text = vm.value
        activateMobileHeaderView.headerImageView.image = vm.image
    }
}
