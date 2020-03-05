//
//  AppDelegate.swift
//  DemoApp
//
//  Created by Vaibhav on 05/03/20.
//  Copyright © 2020 Vaibhav. All rights reserved.
//

import UIKit
import AP_PaySDK

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
    
}


extension AppDelegate {
    
    func application(_ application: UIApplication, handleOpen url: URL) -> Bool {
        PaySDK.shared.processOrder(url: url)
        return true
    }
    
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        PaySDK.shared.processOrder(url: url)
        return true
    }
    
    
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        PaySDK.shared.processOrder(url: url)
        return true
    }
    
}
