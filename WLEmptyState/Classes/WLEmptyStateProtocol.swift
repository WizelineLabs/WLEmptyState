//
//  WLEmptyStateProtocol.swift
//  WLEmptyState
//
//  Created by Abel Martinez  on 4/25/19.
//

import Foundation

struct AssociatedKeys {
    static var emptyStateDelegate = "emptyStateDelegate"
    static var emptyStateDataSource = "emptyStateDataSource"
    static var emptyStateView = "emptyStateView"
}

/// This protocol provides the basic needed to override emptyViewState on anyclass that supports it
protocol WLEmptyStateProtocol: AnyObject {
    static func configure()
    func removeEmptyView()
    
    var numberOfItems: Int { get }
    var emptyStateDelegate: WLEmptyStateDelegate? { get set }
    var emptyStateDataSource: WLEmptyStateDataSource? { get set }
    var emptyStateView: EmptyStateView { get set }
}

extension WLEmptyStateProtocol {
    
    func removeEmptyView() {
        if emptyStateView.superview != nil {
            emptyStateView.removeFromSuperview()
        }
    }
    
    var emptyStateView: EmptyStateView {
        get {
            guard let emptyStateView = objc_getAssociatedObject(self, &AssociatedKeys.emptyStateView) as? EmptyStateView else {
                let emptyStateView = EmptyStateView(frame: .zero)
                self.emptyStateView = emptyStateView
                Logger.logInfo("Empty view created")
                return emptyStateView
            }
            return emptyStateView
        }
        
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.emptyStateView, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}

extension WLEmptyStateProtocol where Self: UITableView {
    
    var numberOfItems: Int {
        var items = 0
        let numberOfSections = dataSource?.numberOfSections?(in: self) ?? 0
        for section in 0..<numberOfSections {
            items += dataSource?.tableView(self, numberOfRowsInSection: section) ?? 0
        }
        return items
    }
    
}

extension WLEmptyStateProtocol where Self: UICollectionView {
    
    var numberOfItems: Int {
        var items = 0
        let numberOfSections = dataSource?.numberOfSections?(in: self) ?? 0
        for section in 0..<numberOfSections {
            items += dataSource?.collectionView(self, numberOfItemsInSection: section) ?? 0
        }
        return items
    }
}


protocol X {
    var numberOfItems: Int { get }
    
    func reload()
}
