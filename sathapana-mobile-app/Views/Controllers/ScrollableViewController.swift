//
//  ScrollableViewController.swift
//  sathapana-mobile-app
//
//  Created by Sovanndy Ul on 23/3/21.
//

import UIKit

class ScrollableViewController: BaseViewController {
    
    var tableView: UITableView!
    var spinner: UIActivityIndicatorView!
    var refreshControl: UIRefreshControl!
    
    // MARK: - View Cycles

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        registerObservers()
    }
    
    // MARK: - Private
    private func setupView() {
        view.backgroundColor = .white
        
        if tableView == nil {
            // Set up TableView
            tableView = UITableView(frame:view.frame, style: .grouped)
            tableView.delegate = self
            tableView.dataSource = self
            view.addSubview(tableView)
            
            // Set TableView constraint
            if #available(iOS 11.0, *) {
                // Set TableView constraint
                let safeAreaLayoutGuide = self.view.safeAreaLayoutGuide
                tableView.translatesAutoresizingMaskIntoConstraints = false
                tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
                tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
                tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
                tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
            } else {
                tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
                tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            }
        }
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        tableView.separatorStyle = .none
        tableView.backgroundColor = .white
        tableView.backgroundView = nil
        
        if #available(iOS 11.0, *) {
            tableView.insetsContentViewsToSafeArea = true
        } else {
            // Fallback on earlier versions
        }
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .automatic
        } else {
            // Fallback on earlier versions
        }
        
        UITableViewCell.registerClass(tableView)
        
        registerObservers()
    }
    
    
    // MARK: - Register Observer
    func registerObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisplay(notification:)),
                                               name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)),
                                               name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func setupRefreshControl() {
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(self.handleRefresh(_:)), for: UIControl.Event.valueChanged)
        tableView.refreshControl = self.refreshControl
    }
    
    func setupSpinner() {
        self.spinner = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 40, height:40))
        self.spinner.color = UIColor.lightGray
        self.spinner.center = CGPoint(x: UIScreen.main.bounds.size.width / 2, y: UIScreen.main.bounds.size.height / 2)
        self.view.addSubview(spinner)
        spinner.hidesWhenStopped = true
    }
    
    @objc func keyboardWillDisplay(notification: NSNotification) {
        let userInfoKey = UIResponder.keyboardFrameBeginUserInfoKey
        guard let userInfo = notification.userInfo,
              let keyboardRect = userInfo[userInfoKey] as? CGRect else { return }
        
        let keyboardFrame = self.view.convert(keyboardRect, from: nil)
        self.tableView.contentInset.bottom = keyboardFrame.size.height + 50
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        let userInfoKey = UIResponder.keyboardFrameBeginUserInfoKey
        guard let userInfo = notification.userInfo,
              let _ = userInfo[userInfoKey] as? CGRect else { return }
        tableView.contentInset.bottom = 0
    }
    
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        
    }
    
    deinit {
        debugPrint("deinit: \(NSStringFromClass(type(of: self)))")
    }
    
}

// MARK: - Table view data source

extension ScrollableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UITableViewHeaderFooterView()
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 1))
        footerView.backgroundColor = UIColor.clear
        return footerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(for: indexPath) as UITableViewCell
    }
}

extension ScrollableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        //cell.contentView.layoutSubviews()
    }
}

extension ScrollableViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer,
                           shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
