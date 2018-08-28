//
//  Extensions.swift
//  JXBaseApp
//
//  Created by wjx on 2018/8/20.
//  Copyright © 2018年 Jiuxing Wang. All rights reserved.
//

import Foundation
import UIKit

extension CGRect {
    public init(width: CGFloat, height: CGFloat) {
        self.init(x: 0, y: 0, width: width, height: height)
    }
    
    public init(size: CGSize) {
        self.init(origin: .zero, size: size)
    }
    
    var center: CGPoint {
        get {
            return CGPoint(x: size.width * 0.5, y: size.height * 0.5)
        }
        set {
            self.origin = CGPoint(x: newValue.x - size.width * 0.5, y: newValue.y - size.height * 0.5)
        }
    }
}

extension UIDevice {
    var isX: Bool {
        guard UIScreen.instancesRespond(to: #selector(getter: UIScreen.currentMode)) else { return false }
        return (UIScreen.main.currentMode?.size.equalTo(CGSize(width: 1125, height: 2436)))!
    }
}

extension UIViewController {
    
    /// Kick out self from the current Navigation stack.
    func kickOutSelfFromNavigationStack() {
        if let vcs = self.navigationController?.viewControllers, !vcs.isEmpty {
            let newVCS = vcs.filter { $0 != self }
            self.navigationController?.setViewControllers(newVCS, animated: false)
        }
    }
}

extension UINavigationController {
    
    /// Replace the Top view controller with the given one and return the original top view controller at last.
    
    @discardableResult
    func replaceTopViewController(_ viewController: UIViewController, animated: Bool) -> UIViewController? {
        let topVC = topViewController
        pushViewController(viewController, animated: animated)
        
        topVC?.kickOutSelfFromNavigationStack()
        
        return topVC
    }
}
