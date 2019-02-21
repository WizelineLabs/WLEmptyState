//
//  DataSourceTests.swift
//  WLEmptyState_Tests
//
//  Created by Jorge Ovalle on 2/13/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import XCTest
import WLEmptyState

class DataSourceTests: XCTestCase {

    override func setUp() {
        WLEmptyState.configure()
    }

    func testDefaultDataSetProperties() {
        let defaultTableViewController = DefaultTableViewController()
        
        let titleDataSource = defaultTableViewController.tableView.emptyStateDataSource?.titleForEmptyDataSet()
        XCTAssertEqual(DefaultDataSource.title, titleDataSource)
        
        let descriptionDataSource = defaultTableViewController.tableView.emptyStateDataSource?.descriptionForEmptyDataSet()
        XCTAssertEqual(DefaultDataSource.description, descriptionDataSource)
        
        guard let url = (Bundle(for: WLEmptyState.self)).url(forResource: "WLEmptyState", withExtension: "bundle"),
            let bundle = Bundle(url: url) else {
                XCTFail("EmptyState image wasn't found.")
                return
        }
        let image = UIImage(named: "Empty", in: bundle, compatibleWith: nil)
        
        let imageDataSource = defaultTableViewController.tableView.emptyStateDataSource?.imageForEmptyDataSet()
        
        XCTAssertEqual(image, imageDataSource)
        XCTAssertNotNil(imageDataSource)
    }
    
    func testCustomDataSetProperties() {
        let customTableViewController = CustomTableViewController()
        
        let title = NSAttributedString(string: "Test title")
        let titleDataSource = customTableViewController.tableView.emptyStateDataSource?.titleForEmptyDataSet()
        XCTAssertEqual(title, titleDataSource)
        
        let description = NSAttributedString(string: "Test description")
        let descriptionDataSource = customTableViewController.tableView.emptyStateDataSource?.descriptionForEmptyDataSet()
        XCTAssertEqual(description, descriptionDataSource)
        
        let imageDataSource = customTableViewController.tableView.emptyStateDataSource?.imageForEmptyDataSet()
        XCTAssertNil(imageDataSource)
    }

}
