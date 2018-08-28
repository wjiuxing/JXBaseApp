//
//  TabBarController.swift
//  JXBaseApp
//
//  Created by wjx on 2018/8/20.
//  Copyright © 2018年 Jiuxing Wang. All rights reserved.
//

import UIKit

// MARK: - TabBarControllerUX

fileprivate struct TabBarControllerUX {
    static let articleTitle = "列表"
    static let articleNormalImageName = "tabbar-list"
    static let articleSelectedImageName = "tabbar-list-selected"
    
    static let profileTitle = "我的"
    static let profileNormalImageName = "tabbar-user"
    static let profileSelectedImageName = "tabbar-user-selected"
}


// MARK: - TabBarController

class TabBarController: UITabBarController {

    var previousSelectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        edgesForExtendedLayout = UIRectEdge(rawValue: 0)
        automaticallyAdjustsScrollViewInsets = false
        
        tabBar.isTranslucent = false
        
        viewControllers = [makeArticleVCStackNavigationController(),
                           makeUserprofileVCStackNavigationController()]
        
        delegate = self
    }
}


// MARK: - TabBarController: fileprivate

fileprivate extension TabBarController {
    fileprivate func makeArticleVCStackNavigationController() -> UINavigationController {
        let vc = ArticleListViewController()
        
        let nvc = UINavigationController(rootViewController: vc)
        nvc.tabBarItem = makeTabBarItem(title: TabBarControllerUX.articleTitle, normalImageName: TabBarControllerUX.articleNormalImageName, selectedImageName: TabBarControllerUX.articleSelectedImageName, tag: 1)
        
        return nvc
    }
    
    fileprivate func makeUserprofileVCStackNavigationController() -> UINavigationController {
        let vc = UserProfileViewController()
        
        let nvc = UINavigationController(rootViewController: vc)
        nvc.tabBarItem = makeTabBarItem(title: TabBarControllerUX.profileTitle, normalImageName: TabBarControllerUX.profileNormalImageName, selectedImageName: TabBarControllerUX.profileSelectedImageName, tag: 2)
        
        return nvc
    }
    
    private func makeTabBarItem(title: String, normalImageName: String, selectedImageName: String, tag: Int) -> UITabBarItem {
        let normal = UIImage(named: normalImageName)
        let selected = UIImage(named: selectedImageName)
        
        let item = UITabBarItem(title: title, image: normal, selectedImage: selected)
        item.tag = tag
        
        return item
    }
}


// MARK: - TabBarController: UITabBarControllerDelegate

extension TabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        guard previousSelectedIndex != tabBarController.selectedIndex else { return }
        
        let secondItemView = tabBarController.tabBar.subviews[tabBarController.selectedIndex + 1]
        let imageView = secondItemView.subviews[0]
        
        let animation = CAKeyframeAnimation(keyPath: "transform.scale")
        animation.values = [1, 1.1, 0.9, 1.0]
        animation.duration = 0.3
        animation.calculationMode = kCAAnimationCubic
        imageView.layer.add(animation, forKey: "")
        
        previousSelectedIndex = tabBarController.selectedIndex
    }
}
