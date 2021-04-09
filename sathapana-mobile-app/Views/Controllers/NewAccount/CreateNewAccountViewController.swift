//
//  CreateNewAccountViewController.swift
//  sathapana-mobile-app
//
//  Created by Sovanndy Ul on 30/3/21.
//

import UIKit

class CreateNewAccountViewController: ScrollableViewController {
    var viewModel: NewAccountViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBackButton(with: true)
        addNextButton()
        registerNibCells()
    }
    
    private func registerNibCells() {
        ActivateMobileTableViewCell.registerNibCell(tableView)
        TextFieldTableViewCell.registerNibCell(tableView)
        AcceptTermTableViewCell.registerNibCell(tableView)
    }
    
    override func nextButtonDidTap() {
        let vc = PinViewController()
        vc.isFromRegistrationFlow = true
        navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: - TableView DataSources
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        guard let newAccountIndexPath = NewAccountIndexPath(rawValue: indexPath.row) else {
            return UITableViewCell()
        }
        let vm = viewModel.values(with: newAccountIndexPath)
        
        switch newAccountIndexPath {
        case .Header:
            let cell:ActivateMobileTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            cell.configCell(with: vm)
            return cell
        case .PhoneNumber:
            let cell:TextFieldTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            cell.textField.becomeFirstResponder()
            cell.configCell(with: vm)
            return cell
        case .Term:
            let cell:AcceptTermTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            cell.configCell(with: vm)
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.allCases
    }
}
