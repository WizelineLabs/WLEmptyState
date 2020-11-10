//
//  UIColor+WLEmptyState.swift
//  WLEmptyState
//
//  Created by Jorge Ovalle on 09/11/20.
//

import Foundation
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
