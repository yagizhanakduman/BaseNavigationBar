//
//  BaseNavigationBarProtocol.swift
//  BaseNavigationBar
//
//  Created by YAGIZHAN AKDUMAN on 6.11.2020.
//  Copyright © 2020 YAGIZHAN AKDUMAN. All rights reserved.
//

import UIKit

// MARK: Base Navigation Bar
protocol BaseNavigationBarProtocol: class {
    var statusBarColor: UIColor? { get set }
    func setupNavigationBar(title: String, subtitle: String?, isWithoutAction: Bool)
}

extension BaseNavigationBarProtocol where Self: UIViewController {
    
    var statusBarColor: UIColor? {
        get {
            return UIApplication.shared.statusBarView?.backgroundColor
        }
        set {
            UIApplication.shared.statusBarView?.backgroundColor = newValue
        }
    }
    
    func setupNavigationBar(title: String, subtitle: String? = nil, isWithoutAction: Bool = false) {
        statusBarColor = .systemTeal
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.view.backgroundColor = .systemTeal
        navigationController?.navigationBar.backgroundColor = .systemTeal
        navigationController?.navigationBar.isTranslucent = true
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        if let subtitle = subtitle {
            setupTitleWithSubtitle(title: title, subtitle: subtitle)
        } else {
            setupFontNavigationBar(title: title)
        }
        isWithoutAction ? () : setupLeftBarItem()
        isWithoutAction ? () : setupRightBarItem()
    }
    
    // MARK: BaseNavigationBarProtocol Private Utility Methods
    private func setupFontNavigationBar(title: String) {
        let navigationTitleFont = UIFont.boldSystemFont(ofSize: 20) //UIFont.MAGreycliffCFBold(size: 20)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: navigationTitleFont]
        self.title = title
    }
    
    private func setupTitleWithSubtitle(title: String, subtitle: String) {
        let titleLabel = UILabel(frame: CGRect(x: 0, y: -5, width: 0, height: 0))
        titleLabel.textColor = .white
        titleLabel.font = .boldSystemFont(ofSize: 20)
        titleLabel.text = title
        titleLabel.textAlignment = .center
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.sizeToFit()
        
        let subtitleLabel = UILabel(frame: CGRect(x: 0, y: 15, width: 0, height: 0))
        subtitleLabel.textColor = .white
        subtitleLabel.font = .systemFont(ofSize: 13)
        subtitleLabel.text = subtitle
        subtitleLabel.textAlignment = .center
        subtitleLabel.adjustsFontSizeToFitWidth = true
        subtitleLabel.sizeToFit()
        setupTitleView(titleLabel: titleLabel, subtitleLabel: subtitleLabel)
    }
    
    private func setupTitleView(titleLabel: UILabel, subtitleLabel: UILabel) {
        let titleView = UIView(frame: CGRect(x: 0, y: 0, width: max(titleLabel.frame.size.width, subtitleLabel.frame.size.width), height: 30))
        titleView.addSubview(titleLabel)
        titleView.addSubview(subtitleLabel)
        let widthDiff = subtitleLabel.frame.size.width - titleLabel.frame.size.width
        widthDiff < 0 ? (subtitleLabel.frame.origin.x = abs(widthDiff / 2)) : (subtitleLabel.frame.origin.x = widthDiff / 2)
        navigationItem.titleView = titleView
    }
    
    private func setupLeftBarItem() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: BaseNavigationActions.self, action: #selector(BaseNavigationActions.leftAction))
    }
    
    private func setupRightBarItem() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .organize, target: BaseNavigationActions.self, action: #selector(BaseNavigationActions.rightAction))
    }
    
}

