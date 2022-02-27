//
//  AppDelegate.swift
//  MVVM Coordinator Example
//
//  Created by Emre on 27.02.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - Instance Properties
    lazy var coordinator = HomeCoordinator(router: router)
    lazy var router = AppDelegateRouter(window: window!)
    lazy var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        coordinator.present(animated: true, onDismissed: nil)
        return true
    }

}
