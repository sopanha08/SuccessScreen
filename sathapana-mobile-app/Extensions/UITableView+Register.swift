//
//  UITableView+Register.swift
//  sathapana-mobile-app
//
//  Created by Sovanndy Ul on 23/3/21.
//

import UIKit

extension UITableView {
    func dequeueReusableCell<T: UITableViewCell>(with identifier: String = T.reuseIdentifier(), for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? T else { return T() }
        return cell
    }
    
    func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(with identifier: String = T.reuseIdentifier()) -> T {
        guard let headerFooterView = dequeueReusableHeaderFooterView(withIdentifier: identifier) as? T else { return T() }
        return headerFooterView
    }
}
