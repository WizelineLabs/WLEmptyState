//
//  UITableViewMocks.swift
//  WLEmptyState_Example
//
//  Created by Jorge Ovalle on 2/13/19.
//

import Foundation
import WLEmptyState

// MARK: Default Empty State on UITableView

final class DefaultTableViewController: UITableViewController, WLEmptyStateDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.emptyStateDataSource = self
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

final class CustomEmptyStateTableViewController: UITableViewController, WLEmptyStateDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.emptyStateDataSource = self
    }
    
    func customViewForEmptyState() -> UIView? {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }
    
}


enum DefaultDataSource {
    static let title = NSAttributedString(string: "Empty DataSet",
                                          attributes: [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .headline)])
    
    static let description = NSAttributedString(string: "Oops There's no data.",
                                                attributes: [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .caption1)])
    
    static let image: UIImage? = {
        guard let url = (Bundle(for: WLEmptyState.self)).url(forResource: "WLEmptyState", withExtension: "bundle"),
            let bundle = Bundle(url: url) else {
                return nil
        }
        return UIImage(named: "Empty", in: bundle, compatibleWith: nil)
    }()
}
