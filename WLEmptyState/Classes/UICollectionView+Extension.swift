//
//  UICollectionView+Extension.swift
//  WLEmptyState
//
//  Created by Abel Martinez  on 4/25/19.
//

import Foundation
import UIKit

extension UICollectionView: WLEmptyStateProtocol {
    
    static func configure() {
        let originalSelector = #selector(reloadData)
        let swizzledSelector = #selector(swizzledReload)
        
        Swizzler.swizzleMethods(for: self, originalSelector: originalSelector, swizzledSelector: swizzledSelector)
    }
    
    /// The object that acts as the delegate of the empty state view.
    public weak var emptyStateDelegate: WLEmptyStateDelegate? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.emptyStateDelegate) as? WLEmptyStateDelegate
        }
        
        set {
            if let newValue = newValue {
                objc_setAssociatedObject(self, &AssociatedKeys.emptyStateDelegate, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
    }
    
    /// The object that acts as the data source of the empty state view.
    public weak var emptyStateDataSource: WLEmptyStateDataSource? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.emptyStateDataSource) as? WLEmptyStateDataSource
        }
        
        set {
            if let newValue = newValue {
                objc_setAssociatedObject(self, &AssociatedKeys.emptyStateDataSource, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
    }
    
    @objc private dynamic func swizzledReload() {
        self.swizzledReload()
        
        if numberOfItems == 0 && self.subviews.count > 1 {
            emptyStateView.titleLabel.attributedText = self.emptyStateDataSource?.titleForEmptyDataSet()
            emptyStateView.descriptionLabel.attributedText = self.emptyStateDataSource?.descriptionForEmptyDataSet()
            emptyStateView.image.image = self.emptyStateDataSource?.imageForEmptyDataSet()
            
            addSubview(emptyStateView)
            
        } else {
            removeEmptyView()
        }
    }
}
