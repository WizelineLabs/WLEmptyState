//
//  UICollectionViewMocks.swift
//  WLEmptyState_Example
//
//  Created by Jorge Ovalle on 6/27/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import WLEmptyState

class DefaultCollectionViewController: UICollectionViewController, WLEmptyStateDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.emptyStateDataSource = self
    }
    
}

class CustomCollectionViewController: UICollectionViewController, WLEmptyStateDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.emptyStateDataSource = self
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

enum DefaultDataSource {
    static let title = NSAttributedString(string: "Empty DataSet",
                                          attributes: [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .headline)])
    
    static let description = NSAttributedString(string: "Oops There's no data.",
                                                attributes: [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .caption1)])
}
