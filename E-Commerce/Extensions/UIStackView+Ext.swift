//
//  UIStackView+Ext.swift
//  E-Commerce
//
//  Created by Enes Sancar on 7.01.2024.
//

import UIKit

extension UIStackView {
    
    func addArrangedSubviewsExt(_ views: UIView...) {
        for view in views { addArrangedSubview(view) }
    }
}
