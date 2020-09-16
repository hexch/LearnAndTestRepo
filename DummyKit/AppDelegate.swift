////  AppDelegate.swift
//  DummyKit
//
//  Created by hexch on 2020/09/14.
//  github:https://github.com/hexch
//
//  Copyright © 2020 hexch. All rights reserved.
//

import UIKit
import FluentDarkModeKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        initFluentDarkModeKit()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


    private func initFluentDarkModeKit(){
        let configuration = DMEnvironmentConfiguration()
        // optional, register a callback for theme change
        configuration.themeChangeHandler = {
            print("theme changed")
        }
        // optional, whether UIImageAsset is used for dynamic image
        // only available for iOS 13+, images marked with "Preserve
        // Vector Data" is not to be used when it is set to true,
        // default to false.
        configuration.useImageAsset = false

        DarkModeManager.setup(with: configuration)
        DarkModeManager.register(with: UIApplication.shared)
        DMTraitCollection.setOverride(DMTraitCollection(userInterfaceStyle: .light), animated: true) // Change to light theme with animation

    }
}

