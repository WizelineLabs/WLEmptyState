//
//  WLEmptyStateDataSource.swift
//  WLEmptyState
//
//  Created by Jorge Ovalle on 12/6/18.
//  Copyright © 2018 Wizeline. All rights reserved.
//

import Foundation
import UIKit

/// This protocol provides the table view object with the information it needs to construct and modify a `EmptyStateView`.
public protocol WLEmptyStateDataSource: class {
    
    /// Asks the data source for the description of the `EmptyStateView`.
    ///
    /// - Returns: An instance of UIImage as icon of the `EmptyStateView`.
    func imageForEmptyDataSet() -> UIImage?
    
    /// Asks the data source for the title of the `EmptyStateView`.
    ///
    /// - Returns: The styled title for the empty view.
    func titleForEmptyDataSet() -> NSAttributedString
    
    /// Asks the data source for the image of the `EmptyStateView`.
    ///
    /// - Returns: The styled description for the empty view.
    func descriptionForEmptyDataSet() -> NSAttributedString
    
    /// Ask the data source for a custom view to be used as Empty State View.
    ///
    /// - Returns: The custom view to be used.
    func customViewForEmptyState() -> UIView?
    
}

// MARK: - WLEmptyStateDataSource Default

public extension WLEmptyStateDataSource {
    
    func imageForEmptyDataSet() -> UIImage? {
        DefaultEmptyState.image
    }
    
    func titleForEmptyDataSet() -> NSAttributedString {
        DefaultEmptyState.title
    }
    
    func descriptionForEmptyDataSet() -> NSAttributedString {
        DefaultEmptyState.description
    }
    
    func customViewForEmptyState() -> UIView? {
        return nil
    }
    
}


enum DefaultEmptyState {
    
    static var image: UIImage? {
        #if SWIFT_PACKAGE
            let resourceBundle = Bundle.module
        #else
            guard let url = (Bundle(for: WLEmptyState.self)).url(forResource: "WLEmptyState", withExtension: "bundle"),
                  let resourceBundle = Bundle(url: url) else {
                return nil
            }
        #endif
        return UIImage(named: EmptyStateView.DefaultConstants.image, in: resourceBundle, compatibleWith: nil)
    }
    
    static var title: NSAttributedString {
        NSAttributedString(string: EmptyStateView.DefaultConstants.title, attributes: [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .headline)])
    }
    
    static var description: NSAttributedString {
        NSAttributedString(string: EmptyStateView.DefaultConstants.description, attributes: [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .caption1)])
    }
    
}
