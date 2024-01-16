//
//  CartCollectionViewCell.swift
//  E-Commerce
//
//  Created by Enes Sancar on 16.01.2024.
//

import UIKit
import SnapKit
import Kingfisher

protocol CartCollectionViewCellInterface: AnyObject {
    func plusStepperValueChanged(indexPath: IndexPath?)
    func minusStepperValueChanged(indexPath: IndexPath?)
    func removeButtonTapped(indexPath: IndexPath?)
}

final class CartCollectionViewCell: UICollectionViewCell {
    static let identifier = "CartCollectionViewCell"
    
    var indexPath: IndexPath?
    weak var delegate: CartCollectionViewCellInterface?
    
    //MARK: - Properties
    private lazy var productImage = CustomImageView(image: UIImage(systemName: "exclamationmark.circle"), contentMode: .scaleAspectFit)
    
    private lazy var productTitle = TitleLabel(fontSize: 15, textColor: .label, numberOfLines: .zero)
    private lazy var removeButton = CustomButton(bgColor: .clear, color: .gray, systemImageName: "trash")
    private lazy var titleAndRemoveHStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        return stackView
    }()
    
    private lazy var categoryLabel = TitleLabel(fontSize: 12, textColor: .gray, numberOfLines: 1)
    private lazy var priceLabel = TitleLabel(fontSize: 18, textColor: .label)
    
    private lazy var stepperLabel = TitleLabel(fontSize: 15, textAlignment: .center, textColor: .label)
    private lazy var stepperPlusButton = CustomButton(bgColor: .systemGray3, color: .label, systemImageName: "plus", cornerStyle: .capsule)
    private lazy var stepperMinusButton = CustomButton(bgColor: .systemGray3, color: .label, systemImageName: "minus", cornerStyle: .capsule)
    
    private lazy var stepperHStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        return stackView
    }()
    
    private lazy var stepperAndPriceHStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        return stackView
    }()
    
    private lazy var allVStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
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
        layer.cornerRadius = 20
        
        addSubview(productImage)
        addSubview(allVStack)
        
        allVStack.addArrangedSubviewsExt(titleAndRemoveHStack, categoryLabel, stepperAndPriceHStack)
        
        titleAndRemoveHStack.addArrangedSubviewsExt(productTitle, removeButton)
        stepperAndPriceHStack.addArrangedSubviewsExt(priceLabel, stepperHStack)
        stepperHStack.addArrangedSubviewsExt(stepperMinusButton, stepperLabel, stepperPlusButton)
        
        configureProductImage()
        configureAllVStack()
        configureStepperButton()
        configureActions()
        configureRemoveButton()
    }
    
    private func configureProductImage() {
        productImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(10)
            make.width.height.equalTo(100)
        }
    }
    
    private func configureAllVStack() {
        allVStack.snp.makeConstraints { make in
            make.leading.equalTo(productImage.snp.trailing).offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.centerY.equalToSuperview()
        }
    }
    
    private func configureStepperButton() {
        stepperMinusButton.snp.makeConstraints { make in
            make.width.height.equalTo(40)
        }
        
        stepperPlusButton.snp.makeConstraints { make in
            make.width.height.equalTo(40)
        }
    }
    
    private func configureRemoveButton() {
        removeButton.snp.makeConstraints { make in
            make.width.height.equalTo(50)
        }
    }
    
    private func configureActions() {
        let removeAction = UIAction { [weak self] _ in
            guard let self else { return }
            self.removeButtonTapped()
        }
        removeButton.addAction(removeAction, for: .touchUpInside)
        
        let stepperMinusAction = UIAction { [weak self] _ in
            guard let self else { return }
            self.stepperMinusButtonTapped()
        }
        stepperMinusButton.addAction(stepperMinusAction, for: .touchUpInside)
        
        let stepperPlusAction = UIAction { [weak self] _ in
            guard let self else { return }
            self.stepperPlusButtonTapped()
        }
        stepperPlusButton.addAction(stepperPlusAction, for: .touchUpInside)
    }
    
    public func updateUI(cartItem: CartItem) {
        if let imageURL = cartItem.product.image {
            productImage.kf.setImage(with: imageURL.asUrl)
        }
        
        if let title = cartItem.product.title {
            productTitle.text = title
        }
        
        if let category = cartItem.product.category?.rawValue {
            categoryLabel.text = category
        }
        
        if let price = cartItem.product.price?.description {
            priceLabel.text = "\(price)₺"
        }
        
        stepperLabel.text = cartItem.count.description
    }
    
    private func removeButtonTapped() {
        delegate?.removeButtonTapped(indexPath: indexPath)
    }
    
    private func stepperMinusButtonTapped() {
        delegate?.minusStepperValueChanged(indexPath: indexPath)
    }
    
    private func stepperPlusButtonTapped() {
        delegate?.plusStepperValueChanged(indexPath: indexPath)
    }
}

