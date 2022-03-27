//
//  AppDelegate.swift
//  LAB_3
//
//  Created by Сергей Адольевич on 20.03.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let initialViewController = InitialViewController()
        let navigationViewController = UINavigationController(rootViewController: initialViewController)
        navigationViewController.view.backgroundColor = .systemBackground
        
        window?.rootViewController = navigationViewController
        window?.makeKeyAndVisible()
        return true
    }

}

