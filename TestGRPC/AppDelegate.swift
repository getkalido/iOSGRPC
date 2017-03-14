//
//  AppDelegate.swift
//  TestGRPC
//
//  Created by Theo Crous on 2017/03/02.
//  Copyright © 2017 Kalido. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)
    
    override init() {
        super.init()
        // Initialize a blank root controller
        window?.rootViewController = ViewController()
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Show screen (This is not in the delegate, so we can show the uiview asap)
        //window?.backgroundColor = Color.white
        window?.makeKeyAndVisible()
        
        // Publish React didFinishLaunchingWithOptions
        return true
    }
}
