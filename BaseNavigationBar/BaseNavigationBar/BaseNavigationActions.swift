//
//  BaseNavigationActions.swift
//  BaseNavigationBar
//
//  Created by YAGIZHAN AKDUMAN on 6.11.2020.
//  Copyright © 2020 YAGIZHAN AKDUMAN. All rights reserved.
//

import UIKit

// MARK: Base Navigation Bar's Actions
@objc final class BaseNavigationActions: NSObject {
    
    enum Direction {
        case right
        case left
        
        var title: String {
            switch self {
            case .right: return "Right"
            case .left: return "Left"
            }
        }
        
        var message: String {
            switch self {
            case .right: return "This is right action"
            case .left: return "This is left action"
            }
        }
    }
    
    @objc class func rightAction() {
        presentAlert(direction: .right)
    }
    
    @objc class func leftAction() {
        presentAlert(direction: .left)
    }
    
    private class func presentAlert(direction: Direction) {
        guard let viewController = UIApplication.shared.keyWindow?.rootViewController else {
                return
        }
        let alert = UIAlertController(title: direction.title, message: direction.message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        viewController.present(alert, animated: true)
    }
    
}
