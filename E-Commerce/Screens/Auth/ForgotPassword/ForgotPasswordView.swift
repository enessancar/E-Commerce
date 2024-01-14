//
//  ForgotPasswordView.swift
//  E-Commerce
//
//  Created by Enes Sancar on 9.01.2024.
//

import UIKit
import SnapKit

protocol ForgotPasswordViewProtocol: AnyObject{
    func forgotPasswordTapped()
    func signInTapped()
}

final class ForgotPasswordView: UIView {
    
    weak var delegate: ForgotPasswordViewProtocol?
    
    // MARK: - Properties
    private let headLabel = TitleLabel(text: "Forgot Password", fontSize: 20)
    lazy var emailTextField               = CustomTextField(fieldType: .email)
    
    private lazy var forgotPasswordButton = CustomButton(
        bgColor: .productCollectionFavoriteButtonBG,
        color: .productCollectionFavoriteButtonBG,
        title: "Submit",
        fontSize: 22,
        cornerStyle: .capsule)
    
    private let infoLabel = SecondaryTitleLabel(
        text: "Already have an account?",
        fontSize: 16,
        fontWeight: .regular,
        numberOfLines: 1)
    
    private lazy var signInButton =  CustomButton(
        bgColor:.clear,
        color: .label,
        title: "Sign In.",
        fontSize: 16,
        fontWeight: .bold)
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        return stackView
    }()
    
    //MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Configuration
    private func configureUI() {
        
        configureHeadLabel()
        configureTextField()
        configureForgotPassword()
        configureStackView()
    }
    
    private func configureHeadLabel() {
        addSubview(headLabel)
        
        headLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(30)
            make.leading.equalToSuperview().offset(20)
        }
    }
    
    private func configureTextField() {
        addSubview(emailTextField)
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(headLabel.snp.bottom).offset(40)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(50)
        }
    }
    
    private func configureForgotPassword() {
        addSubview(forgotPasswordButton)
        
        forgotPasswordButton.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(20)
            make.leading.trailing.height.equalTo(emailTextField)
        }
        
        let forgotPasswordAction = UIAction { [weak self] _ in
            guard let self else { return }
            self.didTapForgotPassword()
        }
        forgotPasswordButton.addAction(forgotPasswordAction, for: .touchUpInside)
    }
    
    private func configureStackView() {
        addSubview(stackView)
        
        stackView.addArrangedSubviewsExt(infoLabel, signInButton)
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(forgotPasswordButton.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
        }
        let signInAction = UIAction { [weak self] _ in
            guard let self else { return }
            self.didTapSignIn()
        }
        signInButton.addAction(signInAction, for: .touchUpInside)
    }
    
    // MARK: - @Actions
    private func didTapForgotPassword() {
        delegate?.forgotPasswordTapped()
    }
    
    private func didTapSignIn() {
        delegate?.signInTapped()
    }
}
