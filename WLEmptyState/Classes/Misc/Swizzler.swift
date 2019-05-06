//
//  WLSwizzler.swift
//  WLEmptyState
//
//  Created by Abel Martinez  on 4/25/19.
//

import Foundation

struct Swizzler {
    
    static func swizzleMethods(for sourceClass: AnyClass?, originalSelector: Selector, swizzledSelector: Selector) {
        guard let originalMethod = class_getInstanceMethod(sourceClass, originalSelector),
            let swizzledMethod = class_getInstanceMethod(sourceClass, swizzledSelector) else {
                Logger.logWarning("Didn't find selector to swizzle")
                return
        }
        
        let didAddMethod = class_addMethod(sourceClass, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))
        
        if didAddMethod {
            class_replaceMethod(sourceClass.self, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod))
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    }
}
