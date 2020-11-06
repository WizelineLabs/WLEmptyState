
import UIKit

extension UIColor {
    
    static var background: UIColor {
        if #available(iOS 13, *) {
            return .systemBackground
        }
        return white
    }
    
    static var accent: UIColor = {
        if #available(iOS 13, *) {
            return UIColor { (UITraitCollection: UITraitCollection) -> UIColor in
                if UITraitCollection.userInterfaceStyle == .dark {
                    return UIColor.white
                } else {
                    return UIColor.black
                }
            }
        }
        return UIColor.black
    }()   
    
}
