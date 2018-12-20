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
    
}

// MARK: - WLEmptyStateDataSource Default

public extension WLEmptyStateDataSource {
    
    func imageForEmptyDataSet() -> UIImage? {
        return UIImage(named: "Empty")
    }
    
    func titleForEmptyDataSet() -> NSAttributedString {
        let title = NSAttributedString(string: "Empty DataSet", attributes: [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .headline)])
        return title
    }
    
    func descriptionForEmptyDataSet() -> NSAttributedString {
        let title = NSAttributedString(string: "Oops There's no data.", attributes: [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .caption1)])
        return title
    }
}
