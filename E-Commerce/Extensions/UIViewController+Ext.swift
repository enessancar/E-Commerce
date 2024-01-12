//
//  UIViewController+Ext.swift
//  E-Commerce
//
//  Created by Enes Sancar on 11.01.2024.
//

import UIKit.UIViewController

extension UIViewController {
    
    func presentAlert(title: String, message: String, buttonTitle: String) {
        let alertVC = AlertVC(alertTitle: title, message: message, buttonTitle: buttonTitle)
        alertVC.modalPresentationStyle  = .overFullScreen
        alertVC.modalTransitionStyle    = .crossDissolve
        self.present(alertVC, animated: true)
    }
    
    
}
