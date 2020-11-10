//
//  WLEmptyState.swift
//  iOSSnapshotTestCase
//
//  Created by Jorge Ovalle on 5/5/19.
//

import UIKit

public final class WLEmptyState {
    
    /// Calling `configure()` method is necessary to setup the WLEmptyState. It works by method swizzling the UITableView and UICollectionView.
    public static func configure() {
        UICollectionView.configure()
        UITableView.configure()
    }
    
}
