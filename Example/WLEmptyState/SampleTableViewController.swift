//
//  SampleTableViewController.swift
//  WLEmptyState
//
//  Created by lojals on 12/10/2018.
//  Copyright (c) 2018 lojals. All rights reserved.
//

import UIKit
import WLEmptyState

final class SampleTableViewController: UITableViewController, WLEmptyStateDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.emptyStateDataSource = self
    }
    
}

