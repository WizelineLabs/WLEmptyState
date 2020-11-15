//
//  DelegateTests.swift
//  WLEmptyState_Example
//
//  Created by Jorge Ovalle on 8/1/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import XCTest
import UIKit
import WLEmptyState

class DelegateTests: XCTestCase {
    
    override func setUp() {
        WLEmptyState.configure()
    }
    
    // MARK: - UTableView
    func testShouldScrollDelegatePropertyOnTableDefault() {
        let defaultTableViewController = DefaultTableViewController()
        
        let enableScrollForEmptyState = defaultTableViewController.tableView.emptyStateDelegate?.enableScrollForEmptyState()
        XCTAssertEqual(true, enableScrollForEmptyState)
    }
    
    func testShouldScrollDelegatePropertyOnTableCustom() {
        let customTableViewController = CustomEmptyStateTableViewController()
        
        let enableScrollForEmptyState = customTableViewController.tableView.emptyStateDelegate?.enableScrollForEmptyState()
        XCTAssertEqual(false, enableScrollForEmptyState)
    }
    
    // MARK: - UICollectionView
    func testShouldScrollDelegatePropertyOnCollectionDefault() {
        let defaultCollectionViewController = DefaultCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        
        let enableScrollForEmptyState = defaultCollectionViewController.collectionView.emptyStateDelegate?.enableScrollForEmptyState()
        XCTAssertEqual(true, enableScrollForEmptyState)
    }
    
    func testShouldScrollDelegatePropertyOnCollectionCustom() {
        let customCollectionViewController = CustomCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        
        let enableScrollForEmptyState = customCollectionViewController.collectionView.emptyStateDelegate?.enableScrollForEmptyState()
        XCTAssertEqual(false, enableScrollForEmptyState)
    }
    
}
