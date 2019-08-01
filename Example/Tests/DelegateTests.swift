//
//  DelegateTests.swift
//  WLEmptyState_Example
//
//  Created by Jorge Ovalle on 8/1/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import XCTest
import WLEmptyState

class DelegateTests: XCTestCase {
    
    override func setUp() {
        WLEmptyState.configure()
    }
    
    // MARK: - UTableView
    func testShouldScrollDelegatePropertyOnTableDefault() {
        let defaultTableViewController = DefaultTableViewController()
        
        let shouldScrollTableView = defaultTableViewController.tableView.emptyStateDelegate?.emptyStateShouldScroll()
        XCTAssertEqual(true, shouldScrollTableView)
    }
    
    func testShouldScrollDelegatePropertyOnTableCustom() {
        let customTableViewController = CustomEmptyStateTableViewController()
        
        let shouldScrollTableView = customTableViewController.tableView.emptyStateDelegate?.emptyStateShouldScroll()
        XCTAssertEqual(false, shouldScrollTableView)
    }
    
    // MARK: - UICollectionView
    func testShouldScrollDelegatePropertyOnCollectionDefault() {
        let defaultCollectionViewController = DefaultCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        
        let shouldScrollTableView = defaultCollectionViewController.collectionView.emptyStateDelegate?.emptyStateShouldScroll()
        XCTAssertEqual(true, shouldScrollTableView)
    }
    
    func testShouldScrollDelegatePropertyOnCollectionCustom() {
        let customCollectionViewController = CustomCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        
        let shouldScrollTableView = customCollectionViewController.collectionView.emptyStateDelegate?.emptyStateShouldScroll()
        XCTAssertEqual(false, shouldScrollTableView)
    }
    
}
