//
//  UIApplication+BaseNavigationBar.swift
//  BaseNavigationBar
//
//  Created by YAGIZHAN AKDUMAN on 6.11.2020.
//  Copyright © 2020 YAGIZHAN AKDUMAN. All rights reserved.
//

import UIKit

extension UIApplication {
    
    var statusBarView: UIView? {
        if #available(iOS 13, *) {
            let tag = 31415926
            if let statusBar = self.keyWindow?.viewWithTag(tag) {
                return statusBar
            }
            let newStatusBar = UIView(frame: UIApplication.shared.statusBarFrame)
            newStatusBar.tag = tag
            self.keyWindow?.addSubview(newStatusBar)
            return newStatusBar
        } else {
            return value(forKey: "statusBar") as? UIView
        }
    }
    
}
