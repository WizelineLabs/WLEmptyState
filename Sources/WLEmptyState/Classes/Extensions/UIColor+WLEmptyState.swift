//
//  UIColor+WLEmptyState.swift
//  WLEmptyState
//
//  Created by Jorge Ovalle on 09/11/20.
//

import UIKit

extension UIColor {

    static var accent: UIColor = {
        UIColor { traitCollection in
            traitCollection.userInterfaceStyle == .dark ? .white : .black
        }
    }()

}
