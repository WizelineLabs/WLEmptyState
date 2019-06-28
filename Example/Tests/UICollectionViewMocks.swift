//
//  UICollectionViewMocks.swift
//  WLEmptyState_Example
//
//  Created by Jorge Ovalle on 6/27/19.
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
