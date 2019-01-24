//
//  SnapshotTests.swift
//  WLEmptyState_Tests
//
//  Created by Leonardo Adolfo Garcia E. on 1/23/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import XCTest
import FBSnapshotTestCase

class SnapshotTests: FBSnapshotTestCase {

    override func setUp() {
        super.setUp()
        //To save a new state of a view in a reference image, turn record mode on
        //recordMode = true
    }

    override func tearDown() {
        super.tearDown()
    }

    func testSampleTableViewControllerEmpty() {
        let sampleTableViewController = SampleTableViewController()
        FBSnapshotVerifyView(sampleTableViewController.view)
    }

}
