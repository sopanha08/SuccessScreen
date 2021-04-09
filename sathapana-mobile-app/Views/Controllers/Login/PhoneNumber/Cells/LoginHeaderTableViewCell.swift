//
//  LoginHeaderTableViewCell.swift
//  sathapana-mobile-app
//
//  Created by Sovanndy Ul on 1/4/21.
//

import UIKit

class LoginHeaderTableViewCell: UITableViewCell, CellProtocol {
    @IBOutlet weak var headerTitleLabel: UILabel!
    @IBOutlet weak var headerDetailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    private func setupUI () {
        selectionStyle = .none
        headerTitleLabel.textColor = .init(hexString: "#3B97D3")
        headerDetailLabel.textColor = .init(hexString: "#797676")
    }
    
    func configCell(with viewModel: BaseViewModel) {
        guard let vm = viewModel as? TextFieldViewModel else { return }
        
        headerTitleLabel.text = vm.placeHolder
        headerDetailLabel.text = vm.value
    }
}
