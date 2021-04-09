//
//  ChooseGenderTableViewCell.swift
//  sathapana-mobile-app
//
//  Created by Sovanndy Ul on 25/3/21.
//

import UIKit

class ChooseGenderTableViewCell: UITableViewCell, CellProtocol {
    @IBOutlet weak var manCheckBox: CheckBox!
    @IBOutlet weak var femaleCheckBox: CheckBox!

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func configCell(with viewModel: BaseViewModel) {
        guard let vm = viewModel as? TextFieldViewModel else { return }
        let isFemale = vm.value == "FEMALE"
        manCheckBox.isChecked = !isFemale
        femaleCheckBox.isChecked = isFemale
    }
}
