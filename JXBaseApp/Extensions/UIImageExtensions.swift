//
//  UIImageExtensions.swift
//  JXBaseApp
//
//  Created by wjx on 2018/8/20.
//  Copyright © 2018年 Jiuxing Wang. All rights reserved.
//

import UIKit

extension UIImage {
    static let cache = NSCache<UIColor, UIImage>()
    
    class func image(with color: UIColor) -> UIImage? {
        if let image = self.cache.object(forKey: color) { return image }
        
        if let image = self.image(with: color, size: CGSize(width: 1, height: 1)) {
            self.cache.setObject(image, forKey: color)
            
            return image
        }
        
        return nil
    }
    
    private class func image(with color: UIColor, size: CGSize) -> UIImage? {
        let rect = CGRect(origin: .zero, size: size)
        
        UIGraphicsBeginImageContext(rect.size)
        defer {
            UIGraphicsEndImageContext()
        }
        
        if let context = UIGraphicsGetCurrentContext() {
            context.setFillColor(color.cgColor)
            context.fill(rect)
            
            return UIGraphicsGetImageFromCurrentImageContext()
        }
        
        return nil
    }
    
    class func resizedImage(with color: UIColor, cornerRadius: CGFloat) -> UIImage? {
        let minEdgeSize = cornerRadius * 2 + 1
        
        let rect = CGRect(x: 0, y: 0, width: minEdgeSize, height: minEdgeSize)
        
        let roundedRect = UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius)
        roundedRect.lineWidth = 0
        
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        defer {
            UIGraphicsEndImageContext()
        }
        
        color.setFill()
        roundedRect.fill()
        roundedRect.stroke()
        roundedRect.addClip()
        
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
    public static func templateImageNamed(_ name: String) -> UIImage? {
        return UIImage(named: name)?.withRenderingMode(.alwaysTemplate)
    }
}
