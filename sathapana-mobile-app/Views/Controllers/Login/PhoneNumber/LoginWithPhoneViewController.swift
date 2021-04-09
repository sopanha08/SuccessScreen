//
//  LoginWithPhoneViewController.swift
//  sathapana-mobile-app
//
//  Created by Sovanndy Ul on 29/3/21.
//

import UIKit

class LoginWithPhoneViewController: ScrollableViewController {
    var viewModel: LoginWithMobileViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBackButton(with: true)
        addNextButton()
        registerNibCells()
    }
    
    private func registerNibCells() {
        LoginHeaderTableViewCell.registerNibCell(tableView)
        TextFieldTableViewCell.registerNibCell(tableView)
        ForgetPassowrdTableViewCell.registerNibCell(tableView)
    }
    
    override func nextButtonDidTap() {
        
    }
    
    // MARK: - TableView DataSources
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        guard let loginIndexPath = LoginWithMobileIndexPath(rawValue: indexPath.row) else {
            return UITableViewCell()
        }
        let vm = viewModel.values(with: loginIndexPath)
        
        switch loginIndexPath {
        case .Header:
            let cell:LoginHeaderTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            cell.configCell(with: vm)
            return cell
        case .PhoneNumber:
            let cell:TextFieldTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            cell.textField.becomeFirstResponder()
            cell.configCell(with: vm)
            return cell
        case .Password:
            let cell:TextFieldTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            cell.configCell(with: vm)
            return cell
        case .ForgetPassword:
            let cell:ForgetPassowrdTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            cell.delegate = self
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.allCases
    }
}

extension LoginWithPhoneViewController: ForgetPassowrdTableViewCellDelegate {
    func forgetPasswordDidTap() {
        let vc = ForgetPasswordViewController()
        vc.viewModel = ForgetPasswordViewModel()
        navigationController?.pushViewController(vc, animated: true)
    }
}
