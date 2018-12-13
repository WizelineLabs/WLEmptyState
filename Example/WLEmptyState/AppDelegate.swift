//
//  AppDelegate.swift
//  WLEmptyState
//
//  Created by lojals on 12/10/2018.
//  Copyright (c) 2018 lojals. All rights reserved.
//

import UIKit
import WLEmptyState

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        WLEmptyState.configure()
        
        return true
    }

}

