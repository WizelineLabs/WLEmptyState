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
    
    var numberOfItems: Int {
        var items = 0
        let numberOfSections = getNumberOfSections()
        for section in 0..<numberOfSections {
            items += getNumberOfItems(in: section)
        }
        return items
    }
    
    private func getNumberOfSections() -> Int {
        return (self as? UITableView).flatMap { $0.dataSource?.numberOfSections?(in: $0) } ??
            (self as? UICollectionView).flatMap { $0.dataSource?.numberOfSections?(in: $0) } ?? 1
    }
    
    private func getNumberOfItems(in section: Int) -> Int {
        return (self as? UITableView).flatMap { $0.dataSource?.tableView($0, numberOfRowsInSection: section) } ??
            (self as? UICollectionView).flatMap { $0.dataSource?.collectionView($0, numberOfItemsInSection: section) } ?? 1
    }
}
