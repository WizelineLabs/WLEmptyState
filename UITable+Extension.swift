//
//  UITable+Extension.swift
//  WLEmptyState
//
//  Created by Jorge Ovalle on 12/5/18.
//  Copyright © 2018 Wizeline. All rights reserved.
//

import Foundation
import UIKit

public class WLEmptyState {
    public static func configure() {
        UITableView.configure()
    }
}

extension UITableView {
    
    fileprivate static func configure() {
        let originalSelector = #selector(reloadData)
        let swizzledSelector = #selector(swizzledReload)
        
        guard let originalMethod = class_getInstanceMethod(self, originalSelector),
            let swizzledMethod = class_getInstanceMethod(self, swizzledSelector) else {
                return
        }
        
        let didAddMethod = class_addMethod(self, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))
        
        if didAddMethod {
            class_replaceMethod(UITableView.self, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod))
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    }

    @objc private dynamic func swizzledReload() {
        self.swizzledReload()
        
        if numberOfItems == 0 && self.subviews.count > 1 {
            emptyStateView.titleLabel.attributedText = self.emptyStateDataSource?.titleForEmptyDataSet()
            emptyStateView.descriptionLabel.attributedText = self.emptyStateDataSource?.descriptionForEmptyDataSet()
            emptyStateView.image.image = self.emptyStateDataSource?.imageForEmptyDataSet()
            
//            insertSubview(emptyStateView, at: 0)
            addSubview(emptyStateView)
            
        } else {
            removeEmptyView()
        }
    }
    
    private func removeEmptyView() {
        if emptyStateView.superview != nil {
            emptyStateView.removeFromSuperview()
        }
    }
    
    private var numberOfItems: Int {
        var items = 0
        let numberOfSections = dataSource?.numberOfSections?(in: self) ?? 0
        for section in 0..<numberOfSections {
            items += dataSource?.tableView(self, numberOfRowsInSection: section) ?? 0
        }
        return items
    }
    
    private struct AssociatedKeys {
        static var emptyStateDelegate = "emptyStateDelegate"
        static var emptyStateDataSource = "emptyStateDataSource"
        static var emptyStateView = "emptyStateView"
    }

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
    
    var emptyStateView: EmptyStateView {
        get {
            guard let emptyStateView = objc_getAssociatedObject(self, &AssociatedKeys.emptyStateView) as? EmptyStateView else {
                let emptyStateView = EmptyStateView(frame: .zero)
                self.emptyStateView = emptyStateView
                return emptyStateView
            }
            return emptyStateView
        }
        
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.emptyStateView, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

}
