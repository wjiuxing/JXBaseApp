//
//  BaseViewController.swift
//  JXBaseApp
//
//  Created by wjx on 2018/8/20.
//  Copyright © 2018年 Jiuxing Wang. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        edgesForExtendedLayout = UIRectEdge(rawValue: 0)
        automaticallyAdjustsScrollViewInsets = false
        
        view.backgroundColor = .backgroundColor
        
        configureNavigationBar()
    }
    
    func configureNavigationBar() { }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
