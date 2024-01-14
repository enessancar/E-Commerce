//
//  SpecialCollectionCell.swift
//  E-Commerce
//
//  Created by Enes Sancar on 13.01.2024.
//

import UIKit
import SnapKit
import Kingfisher

final class SpecialCollectionCell: UICollectionViewCell {
    static let identifier = "SpecialCollectionCell"
    
    //MARK: - Properties
    private lazy var specialImage = CustomImageView(image: UIImage(named: "tekTas"), cornerRadius: 30)
    private lazy var specialTitleLabel = TitleLabel(fontSize: 15, textAlignment: .center)
    private lazy var specialHStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 18
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
        backgroundColor = .systemBackground
        layer.cornerRadius = 24
        
        addSubview(specialHStack)
        specialHStack.addArrangedSubviewsExt(specialTitleLabel, specialImage)
        
        specialHStack.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(10)
            make.leading.equalToSuperview().offset(10)
            make.trailing.bottom.equalToSuperview().offset(-10)
        }
    }
    
    public func configure(with data: Product) {
        specialTitleLabel.text = data.title
        
        if let image = data.image {
            specialImage.kf.setImage(with: image.asUrl)
        }
    }
}
