//
//  UIColor+Example.swift
//  WLEmptyState_Example
//
//  Created by Jorge Ovalle on 09/11/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit

extension UIColor {

    static var accent: UIColor = {
        UIColor { traitCollection in
            traitCollection.userInterfaceStyle == .dark ? .white : .black
        }
    }()

}
