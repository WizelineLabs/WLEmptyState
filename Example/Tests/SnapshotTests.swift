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

    var sampleTableViewController: SampleTableViewController!

    /// Turn on to save a new state of a view in a reference image
    var isRecording: Bool {
        return false
    }

    override func setUp() {
        super.setUp()
        recordMode = isRecording
        sampleTableViewController = SampleTableViewController()
        UIApplication.shared.keyWindow?.rootViewController = sampleTableViewController
    }

    override func tearDown() {
        super.tearDown()
    }

    func testSampleTableViewControllerEmpty() {
        FBSnapshotVerifyView(sampleTableViewController.view)
    }

}
