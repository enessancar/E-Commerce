//
//  CustomImageView.swift
//  E-Commerce
//
//  Created by Enes Sancar on 13.01.2024.
//

import UIKit

final class CustomImageView: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    convenience init(image: UIImage? = nil,
                     contentMode: ContentMode = .scaleAspectFit,
                     cornerRadius: CGFloat = .zero) {
        self.init(frame: .zero)
        self.image = image
        set(contentMode: contentMode, cornerRadius: cornerRadius)
    }
    
    private func set(contentMode: ContentMode = .scaleAspectFit,
                     cornerRadius: CGFloat = .zero) {
        self.contentMode = contentMode
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = cornerRadius > .zero
    }
}
