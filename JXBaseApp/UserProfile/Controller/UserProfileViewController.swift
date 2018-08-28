//
//  UserProfileViewController.swift
//  JXBaseApp
//
//  Created by wjx on 2018/8/20.
//  Copyright © 2018年 Jiuxing Wang. All rights reserved.
//

import UIKit
import SafariServices

// MARK: - UserProfileViewControllerUX

fileprivate struct UserProfileViewControllerUX {
    static let title = "我"
}


// MARK: - UserProfileViewController

class UserProfileViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = UILabel(frame: CGRect(x: 0, y: 100, width: view.bounds.width, height: 200)).then {
            $0.numberOfLines = 4
            $0.textAlignment = .center
            $0.text = "This template provides a starting point\nfor an application for Jiuxing Wang\nwith a base structure in Swift."
            $0.textColor = .lightGray
        }
        view.addSubview(label)
    }
    
    override func configureNavigationBar() {
        super.configureNavigationBar()
        
        navigationItem.title = UserProfileViewControllerUX.title
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Github", style: .plain, target: self, action: #selector(UserProfileViewController.visitButtonTouched(_:)))
    }
}


// MARK: - UserProfileViewController: Target-Action

extension UserProfileViewController {
    @objc func visitButtonTouched(_ barButton: UIBarButtonItem) {
        let vc = SFSafariViewController(url: URL(string: "https://github.com/wjiuxing/PSStackedView")!)
        present(vc, animated: true)
    }
}
