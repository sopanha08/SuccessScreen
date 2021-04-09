//
//  PersonalInformationViewController.swift
//  sathapana-mobile-app
//
//  Created by Sovanndy Ul on 24/3/21.
//

import UIKit

class PersonalInformationViewController: ScrollableViewController {
    var viewModel: PersonalInformationViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBackButton()
        addNextButton()
        registerNibCells()
    }
    
    private func registerNibCells() {
        ActivateMobileTableViewCell.registerNibCell(tableView)
        TextFieldTableViewCell.registerNibCell(tableView)
        ChooseGenderTableViewCell.registerNibCell(tableView)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    // MARK: - Actions
    override func nextButtonDidTap() {
        let viewController = SelfieViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    // MARK: - TableView DataSources
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let prsonalInformationIndexPath = PersonalInformationIndexPath(rawValue: indexPath.row) else {
            return UITableViewCell()
        }
        let value = viewModel.values(with: prsonalInformationIndexPath)
        
        switch prsonalInformationIndexPath {
        case .Header:
            let cell:ActivateMobileTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            cell.configCell(with: value)
            return cell
        case .FullName, .NibNumber, .NibValidate, .DateOfBirth, .Email:
            let cell:TextFieldTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            cell.configCell(with: value)
            return cell
        case .Gender:
            let cell:ChooseGenderTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            cell.configCell(with: value)
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.allCases
    }
}
