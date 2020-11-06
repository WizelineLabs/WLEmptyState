//
//  UITableViewMocks.swift
//  WLEmptyState_Example
//
//  Created by Jorge Ovalle on 2/13/19.
//

import Foundation
@testable import WLEmptyState

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


enum DefaultDataSource {
    static let title = NSAttributedString(string: "Empty DataSet",
                                          attributes: [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .headline)])
    
    static let description = NSAttributedString(string: "Oops There's no data.",
                                                attributes: [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .caption1)])
    
    static let image: UIImage? = {
        #if SWIFT_PACKAGE
           let resourceBundle = Bundle.module
        #else
            guard let url = (Bundle(for: WLEmptyState.self)).url(forResource: "WLEmptyState", withExtension: "bundle"),
                    let resourceBundle = Bundle(url: url) else {
                return nil
            }
        #endif
        
        let image = UIImage(named: "Empty", in: resourceBundle, compatibleWith: nil)
        if #available(iOS 13, *) {
            return  image?.withTintColor(.accent)
        }
        return image
    }()
}
