//
//  AppDelegate.swift
//  ScrollView-StackView
//
//  Created by Shinichiro Kudo on 2021/09/06.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        
        let vc = ViewController()
        let vc2 = SecondViewController()
        let nav = UINavigationController(rootViewController: vc2)
        window.rootViewController = nav
        window.makeKeyAndVisible()
        
        return true
    }

   


}

