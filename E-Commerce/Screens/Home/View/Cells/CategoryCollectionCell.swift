//
//  CategoryCollectionCell.swift
//  E-Commerce
//
//  Created by Enes Sancar on 14.01.2024.
//

import UIKit
import SnapKit

final class CategoryCollectionCell: UICollectionViewCell {
    static let identifier = "CategoryCollectionCell"
    
    //MARK: - Properties
    private lazy var categoryImage = CustomImageView(cornerRadius: 30)
    private lazy var categoryName  = TitleLabel(fontSize: 12, textAlignment: .center, fontWeight: .regular)
    private lazy var categoryVStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 8
        return stackView
    }()
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func configureUI() {
        addSubview(categoryVStack)
        categoryVStack.addArrangedSubviewsExt(categoryImage, categoryName)
        
        categoryImage.backgroundColor = .lightGray
        categoryImage.snp.makeConstraints { make in
            make.width.height.equalTo(60)
        }
        
        categoryVStack.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(80)
        }
    }
    
    public func configure(with data: Category) {
        categoryImage.image = data.image
        categoryName.text = data.name
    }
}
