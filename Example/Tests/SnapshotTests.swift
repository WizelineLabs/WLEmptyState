//
//  SnapshotTests.swift
//  WLEmptyState_Tests
//
//  Created by Leonardo Adolfo Garcia E. on 1/23/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//
import XCTest
import FBSnapshotTestCase
@testable import WLEmptyState_Example

class SnapshotTests: FBSnapshotTestCase {
    
    var sampleTableViewController: SampleTableViewController?
    var sampleCollectionViewController: SampleCollectionViewController?
    /// Turn on to record a reference image of the empty state of the view
    var isRecording: Bool {
        return false
    }
    
    override func setUp() {
        super.setUp()
        recordMode = isRecording
        sampleTableViewController = SampleTableViewController()
        sampleCollectionViewController = SampleCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testEmptySampleTableViewController() {
        UIApplication.shared.keyWindow?.rootViewController = sampleTableViewController
        guard let sampleTableViewController = sampleTableViewController else {
            XCTFail("sampleTableViewController is nil, unable to perform snapshot test")
            return
        }
        FBSnapshotVerifyView(sampleTableViewController.view)
    }
    
    func testEmptySampleCollectionViewController() {
        UIApplication.shared.keyWindow?.rootViewController = sampleCollectionViewController
        guard let sampleCollectionViewController = sampleCollectionViewController else {
            XCTFail("sampleCollectionViewController is nil, unable to perform snapshot test")
            return
        }
        FBSnapshotVerifyView(sampleCollectionViewController.view)
    }
    
}
