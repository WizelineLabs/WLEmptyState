//
//  WLEmptyStateDelegate.swift
//  WLEmptyState
//
//  Created by Jorge Ovalle on 12/6/18.
//  Copyright © 2018 Wizeline. All rights reserved.
//

import Foundation

public protocol WLEmptyStateDelegate: class {
    func enableScrollForEmptyState() -> Bool
}

public extension WLEmptyStateDelegate {
    
    func enableScrollForEmptyState() -> Bool {
        return DefaultConstants.enableScrollForEmptyState
    }
    
}
