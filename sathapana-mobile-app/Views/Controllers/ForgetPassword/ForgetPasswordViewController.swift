//
//  ForgetPasswordViewController.swift
//  sathapana-mobile-app
//
//  Created by Sok Khoinsreng on 3/31/21.
//

import UIKit

class ForgetPasswordViewController: ScrollableViewController {
    var viewModel: ForgetPasswordViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBackButton(with: true)
        addNextButton()
        registerNibCells()
    }
    
    private func registerNibCells() {
        ActivateMobileTableViewCell.registerNibCell(tableView)
        TextFieldTableViewCell.registerNibCell(tableView)
    }
    
    override func nextButtonDidTap() {
        
    }
    
    // MARK: - TableView DataSources
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        guard let forgetPasswordIndexPath = ForgetPasswordIndexPath(rawValue: indexPath.row) else {
            return UITableViewCell()
        }
        let vm = viewModel.values(with: forgetPasswordIndexPath)
        
        switch forgetPasswordIndexPath {
        case .Header:
            let cell:ActivateMobileTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            cell.configCell(with: vm)
            return cell
        case .PhoneNumber:
            let cell:TextFieldTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            cell.textField.becomeFirstResponder()
            cell.configCell(with: vm)
            return cell
        case .AccountNumber:
            let cell:TextFieldTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            cell.configCell(with: vm)
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.allCases
    }
}
