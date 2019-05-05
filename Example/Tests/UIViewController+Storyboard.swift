//
//  UIViewController+Storyboard.swift
//  WLEmptyState_Tests
//
//  Created by Jorge Ovalle on 5/5/19.
//

import UIKit

extension UIViewController {
    
    static func instanciate<T: UIViewController>(type: T.Type) -> T? {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: String(describing: T.self)) as? T
    }
    
}
