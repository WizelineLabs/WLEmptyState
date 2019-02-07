//
//  SampleTableViewController.swift
//  WLEmptyState
//
//  Created by lojals on 12/10/2018.
//  Copyright (c) 2018 lojals. All rights reserved.
//

import UIKit
import WLEmptyState

class SampleTableViewController: UITableViewController, WLEmptyStateDataSource, WLEmptyStateDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.emptyStateDelegate = self
        tableView.emptyStateDataSource = self
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {
            fatalError("Couldn't get cell instance")
        }
        return cell
    }
}

