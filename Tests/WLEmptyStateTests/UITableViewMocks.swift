//
//  UITableViewMocks.swift
//  WLEmptyState_Example
//
//  Created by Jorge Ovalle on 2/13/19.
//

import Foundation
import WLEmptyState
import UIKit

// MARK: Default Empty State on UITableView

final class DefaultTableViewController: UITableViewController, WLEmptyStateDataSource, WLEmptyStateDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.emptyStateDataSource = self
        tableView.emptyStateDelegate = self
    }
    
}

// MARK: Customized default Empty State on UITableView

final class CustomTableViewController: UITableViewController, WLEmptyStateDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.emptyStateDataSource = self
    }
    
    func titleForEmptyDataSet() -> NSAttributedString {
        return NSAttributedString(string: "Test title")
    }
    
    func descriptionForEmptyDataSet() -> NSAttributedString {
        return NSAttributedString(string: "Test description")
    }
    
    func imageForEmptyDataSet() -> UIImage? {
        return nil
    }
}

// MARK: Custom Empty State on UITableView

final class CustomEmptyStateTableViewController: UITableViewController, WLEmptyStateDataSource, WLEmptyStateDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.emptyStateDataSource = self
        tableView.emptyStateDelegate = self
    }
    
    func customViewForEmptyState() -> UIView? {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }
    
    func enableScrollForEmptyState() -> Bool {
        return false
    }
    
}
