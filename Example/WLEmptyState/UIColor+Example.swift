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
        return UIColor { (UITraitCollection: UITraitCollection) -> UIColor in
            if UITraitCollection.userInterfaceStyle == .dark {
                return UIColor.white
            } else {
                return UIColor.black
            }
        }
    }()
    
}
