//
//  AppDelegate.swift
//  JXBaseApp
//
//  Created by wjx on 2018/8/20.
//  Copyright © 2018年 Jiuxing Wang. All rights reserved.
//

import UIKit
import Then

// MARK: - AppDelegate

@UIApplicationMain
class AppDelegate: UIResponder {

    var window: UIWindow?
}


// MARK: - AppDelegate: UIApplicationDelegate

extension AppDelegate: UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        configureWindow()
        
        configureUIThemeColor()
        
        return true
    }
}


// MARK: - AppDelegate: fileprivate

fileprivate extension AppDelegate {
    
    @discardableResult
    func configureWindow() -> UIWindow {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = TabBarController()
        window.makeKeyAndVisible()
        
        self.window = window
        
        return window
    }
    
    fileprivate func configureUIThemeColor() {
        let originImage = UIImage.image(with: .themeColor)
        let backgroundImage = originImage?.resizableImage(withCapInsets: UIEdgeInsets(top: 44, left: 7, bottom: 4, right: 7))
        
        let shadow = NSShadow().then {
            $0.shadowColor = UIColor.clear
            $0.shadowOffset = .zero
        }
        
        let _ = UINavigationBar.appearance().then {
            $0.setBackgroundImage(backgroundImage, for: .default)
            $0.barTintColor = .themeColor
            $0.tintColor = .white
            $0.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white,
                                      NSAttributedStringKey.shadow: shadow,
                                      NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 20)]
        }
        
        let _ = UIBarButtonItem.appearance(whenContainedInInstancesOf: [UINavigationBar.self]).then {
            $0.tintColor = .white
            
            let barButtonItemAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white,
                                           NSAttributedStringKey.shadow: shadow,
                                           NSAttributedStringKey.font: UIFont.systemFont(ofSize: 16)]
            $0.setTitleTextAttributes(barButtonItemAttributes, for: .normal)
        }
        
        let tabBarAppearence = UITabBar.appearance().then {
            $0.backgroundImage = backgroundImage
            $0.barTintColor = .themeColor
            $0.tintColor = .white
        }
        
        if #available(iOS 10, *) {
            tabBarAppearence.unselectedItemTintColor = .white
        }
        
        let _ = UIBarButtonItem.appearance(whenContainedInInstancesOf: [UIToolbar.self]).then {
            $0.tintColor = UIColor(rgb: 0x157EFB)
        }
        
        let _ = UISwitch.appearance().then {
            $0.onTintColor = .themeColor
        }
    }
}
