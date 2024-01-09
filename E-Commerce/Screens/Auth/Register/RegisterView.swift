//
//  RegisterView.swift
//  E-Commerce
//
//  Created by Enes Sancar on 9.01.2024.
//

import UIKit
import SnapKit

protocol RegisterViewProtocol: AnyObject {
    func signUpTapped()
    func signInTapped()
}

final class RegisterView: UIView {
    
    weak var delegate: RegisterViewProtocol?
    
    // MARK: - Properties
    private let headLabel = TitleLabel(text: "Create an account",fontSize: 20)
    
    lazy var userNameTextField = CustomTextField(fieldType: .username)
    lazy var emailTextField = CustomTextField(fieldType: .email)
    lazy var passwordTextField = CustomTextField(fieldType: .password)
    lazy var repasswordTextField = CustomTextField(fieldType: .password)
    
    private lazy var signUpButton = CustomButton(
        bgColor: .productCollectionFavoriteButtonBG,
        color: .productCollectionFavoriteButtonBG,
        title: "Sign Up",
        fontSize: 22,
        cornerStyle: .capsule)
    
    private let infoLabel = SecondaryTitleLabel(
        text: "Already have an account?",fontSize: 16,
        fontWeight: .regular,
        numberOfLines: 1)
    
    private lazy var signInButton = CustomButton(
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
        configureSignUp()
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
        addSubview(userNameTextField)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(repasswordTextField)
        
        userNameTextField.snp.makeConstraints { make in
            make.top.equalTo(headLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.height.equalToSuperview().offset(-20)
            make.height.equalTo(50)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(userNameTextField.snp.bottom).offset(20)
            make.leading.trailing.height.equalTo(userNameTextField)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(20)
            make.leading.trailing.equalTo(emailTextField)
        }
        
        repasswordTextField.placeholder = "Repassword"
        
        repasswordTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(20)
            make.leading.trailing.height.equalTo(passwordTextField)
        }
    }
    
    private func configureSignUp() {
        addSubview(signUpButton)
        
        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(repasswordTextField.snp.bottom).offset(20)
            make.leading.trailing.height.equalTo(userNameTextField)
        }
        
        let signUpAction = UIAction { [weak self] _  in
            guard let self else { return }
            self.didTapSignUp()
        }
        signUpButton.addAction(signUpAction, for: .touchUpInside)
    }
    
    private func configureStackView() {
        addSubview(signInButton)
        addSubview(stackView)
        
        stackView.addArrangedSubviewsExt(infoLabel, signInButton)
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(signUpButton.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
        }
        
        let signInAction = UIAction { [weak self] _  in
            guard let self else { return }
            self.didTapSignIn()
        }
        signInButton.addAction(signInAction, for: .touchUpInside)
    }
    
    // MARK: - Action
    @objc private func didTapSignUp() {
        delegate?.signUpTapped()
    }
    
    @objc private func didTapSignIn() {
        delegate?.signInTapped()
    }
}
