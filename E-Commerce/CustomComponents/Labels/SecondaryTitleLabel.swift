//
//  SecondaryTitleLabel.swift
//  E-Commerce
//
//  Created by Enes Sancar on 7.01.2024.
//

import UIKit

final class SecondaryTitleLabel: UILabel {
    
    enum FontWeight {
        case regular, semibold, bold
    }
    
    //MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Convenience Initializer
    convenience init(text:String? = nil,
                     fontSize: CGFloat,
                     textAlignment: NSTextAlignment = .left,
                     fontWeight: FontWeight = .semibold,
                     textColor: UIColor = .label,
                     numberOfLines: Int = 0) {
        
        self.init(frame: .zero)
        self.text = text
        self.textAlignment = textAlignment
        self.font = UIFont.systemFont(ofSize: fontSize, weight: fontWightToUIFontWeight(weight: fontWeight))
        lineBreakMode = .byTruncatingTail
        self.textColor = textColor
        self.numberOfLines = numberOfLines
    }
    
    //MARK: - Configuration Methods
    private func configureUI() {
        adjustsFontForContentSizeCategory = true
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.9
    }
    
    private func fontWightToUIFontWeight(weight: FontWeight) -> UIFont.Weight {
        switch weight {
        case .regular:
            return .regular
        case .semibold:
            return .semibold
        case .bold:
            return .bold
        }
    }
}
