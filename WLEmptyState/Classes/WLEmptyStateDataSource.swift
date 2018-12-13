//
//  WLEmptyStateDataSource.swift
//  WLEmptyState
//
//  Created by Jorge Ovalle on 12/6/18.
//  Copyright © 2018 Wizeline. All rights reserved.
//

import Foundation
import UIKit

public protocol WLEmptyStateDataSource: class {
    
    func imageForEmptyDataSet() -> UIImage?
    
    func titleForEmptyDataSet() -> NSAttributedString
    
    func descriptionForEmptyDataSet() -> NSAttributedString
    
}

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
