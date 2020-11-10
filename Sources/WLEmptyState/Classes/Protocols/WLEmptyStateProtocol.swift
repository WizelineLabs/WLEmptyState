//
//  WLEmptyStateProtocol.swift
//  WLEmptyState
//
//  Created by Abel Martinez  on 4/25/19.
//

import Foundation
import UIKit

struct AssociatedKeys {
    static var emptyStateDelegate = "emptyStateDelegate"
    static var emptyStateDataSource = "emptyStateDataSource"
    static var emptyStateView = "emptyStateView"
    static var originalScrollingValue = "originalScrollingValue"
}

/// This protocol provides the basic needed to override emptyViewState on anyclass that supports it
protocol WLEmptyStateProtocol: AnyObject {
    static func configure()
    func removeEmptyView()
    
    var numberOfItems: Int { get }
    var emptyStateDelegate: WLEmptyStateDelegate? { get set }
    var emptyStateDataSource: WLEmptyStateDataSource? { get set }
    var emptyStateView: UIView { get set }
}

extension WLEmptyStateProtocol {
    
    func removeEmptyView() {
        if emptyStateView.superview != nil {
            emptyStateView.removeFromSuperview()
        }
    }
    
    var emptyStateView: UIView {
        get {
            guard let emptyStateView = objc_getAssociatedObject(self, &AssociatedKeys.emptyStateView) as? UIView else {
                let emptyStateView = emptyStateDataSource?.customViewForEmptyState() ?? EmptyStateView(frame: .zero)
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
