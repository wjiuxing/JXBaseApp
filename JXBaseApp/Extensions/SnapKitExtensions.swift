//
//  SnapKitExtensions.swift
//  JXBaseApp
//
//  Created by wjx on 2018/8/20.
//  Copyright © 2018年 Jiuxing Wang. All rights reserved.
//

import Foundation
import SnapKit

extension UIView {
    
    var safeArea: ConstraintBasicAttributesDSL {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.snp
        }
        return self.snp
    }
}
