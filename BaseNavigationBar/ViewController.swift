//
//  ViewController.swift
//  BaseNavigationBar
//
//  Created by YAGIZHAN AKDUMAN on 6.11.2020.
//  Copyright © 2020 YAGIZHAN AKDUMAN. All rights reserved.
//

import UIKit

class ViewController: UIViewController, BaseNavigationBarProtocol {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar(title: "Sample", subtitle: "Nice subtitle")
        let _ = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(changeStatusBarColor), userInfo: nil, repeats: false)
    }
    
    @objc private func changeStatusBarColor() {
        statusBarColor = .systemOrange
    }
    
}
