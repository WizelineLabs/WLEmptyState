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
        Logger.shared.logInfo("viewDidLoad")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        Logger.shared.logTrace("Loading cell at index:", obj: indexPath)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell2") else {
            Logger.shared.logError("Couldn't get cell instance")
            fatalError()
        }
        return cell
    }
}

