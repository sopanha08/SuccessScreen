//
//  AppDelegate.swift
//  sathapana-mobile-app
//
//  Created by Sovanndy Ul on 22/3/21.
//

import UIKit
import AlamofireEasyLogger

@main
class AppDelegate: UIResponder, UIApplicationDelegate, CocoaLumberjackProtocol {
    
    var window: UIWindow?
    
    #if DEBUG
    let alamofireLogger = FancyAppAlamofireLogger(prettyPrint: true) {
        debugPrint($0)
    }
    #endif
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let viewController = ChooseLanguageViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.setNavigationBarHidden(true, animated: false)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        setupCocoaLumberjack()
        
        return true
    }
}

