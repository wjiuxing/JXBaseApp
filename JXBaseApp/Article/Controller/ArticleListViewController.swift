//
//  ArticleListViewController.swift
//  JXBaseApp
//
//  Created by wjx on 2018/8/20.
//  Copyright © 2018年 Jiuxing Wang. All rights reserved.
//

import UIKit


// MARK: - ArticleListViewControllerUX

fileprivate struct ArticleListViewControllerUX {
    static let title = "JXBaseApp"
}


// MARK: - ArticleListViewController

class ArticleListViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func configureNavigationBar() {
        super.configureNavigationBar()
        
        navigationItem.title = ArticleListViewControllerUX.title
    }
}
