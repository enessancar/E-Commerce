//
//  LoginView.swift
//  E-Commerce
//
//  Created by Enes Sancar on 7.01.2024.
//

import UIKit
import SnapKit

protocol LoginViewProtocol: AnyObject {
    func signUpTapped()
    func forgotPasswordTapped()
    func googleSignInButtonTapped()
    func signInButtonTapped()
}

final class LoginView: UIView {
    
    //MARK: - Properties
    weak var delegate: LoginViewProtocol?
    
    private let headLabel  = TitleLabel(text: "Let's sign you in", fontSize: 20)
    private let infoLabel  = SecondaryTitleLabel(text: "Don't have an account?", fontSize: 16, fontWeight: .regular, numberOfLines: 1)
    
    lazy var emailTextField = CustomTextField(fieldType: .email)
    lazy var passwordTextField = CustomTextField(fieldType: .password)
    
    private lazy var signInButton  = CustomButton(
        bgColor: .productCollectionFavoriteButtonBG,
        color: .productCollectionFavoriteButtonBG,
        title: "Sign In",
        fontSize: 22)
    
    private lazy var googleSignInButton = CustomButton(
        bgColor: UIColor.systemBlue,
        color: UIColor.systemBlue,
        title: "Sign In with Google",
        fontSize: 22,
        systemImageName: "g.circle.fill")
    
    private lazy var newUserButton = CustomButton(
        bgColor:.clear,
        color: .label,
        title: "Sign Up.",
        fontSize: 16,
        fontWeight: .bold)
    
    private lazy var forgotPasswordButton = CustomButton(
        bgColor:.clear,
        color: .productCollectionFavoriteButtonBG,
        title: "Forgot password?",
        fontSize: 16)
    
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
        backgroundColor = .systemBackground
        
        configureHeadLabel()
        configureTextField()
        configureForgotPassword()
        configureSignIn()
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
        addSubview(passwordTextField)
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(headLabel.snp.bottom).offset(35)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(50)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(20)
            make.leading.trailing.height.equalTo(emailTextField)
        }
    }
    
    private func configureForgotPassword(){
        addSubview(forgotPasswordButton)
        forgotPasswordButton.tintColor = .systemPurple
        
        forgotPasswordButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(10)
            make.trailing.equalTo(passwordTextField.snp.trailing)
        }
        
        let action = UIAction { [weak self] _ in
            guard let self else { return }
            self.didTapForgotPassword()
        }
        forgotPasswordButton.addAction(action, for: .touchUpInside)
    }
    
    private func configureSignIn(){
        addSubview(signInButton)
        addSubview(googleSignInButton)
        
        signInButton.configuration?.cornerStyle = .capsule
        googleSignInButton.configuration?.cornerStyle = .capsule
        
        signInButton.snp.makeConstraints { make in
            make.top.equalTo(forgotPasswordButton.snp.bottom).offset(20)
            make.leading.trailing.height.equalTo(emailTextField)
        }
    
        googleSignInButton.snp.makeConstraints { make in
            make.top.equalTo(signInButton.snp.bottom).offset(20)
            make.leading.trailing.height.equalTo(signInButton)
        }
        
        let signInAction = UIAction { [weak self] _  in
            guard let self else { return }
            self.didTapSignIn()
        }
        signInButton.addAction(signInAction, for: .touchUpInside)
        
        let googleSignInAction = UIAction { [weak self] _ in
            guard let self else { return }
            self.didTapGoogleSignIn()
        }
        googleSignInButton.addAction(googleSignInAction, for: .touchUpInside)
    }
    
    private func configureStackView() {
        addSubview(stackView)
        stackView.addArrangedSubviewsExt(infoLabel, newUserButton)
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(googleSignInButton.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
        }
        
        let newUserAction = UIAction { [weak self] _ in
            guard let self else { return }
            self.didTapNewUser()
        }
        newUserButton.addAction(newUserAction, for: .touchUpInside)
    }
    
    //MARK: - @Actions
    @objc private func didTapNewUser() {
        delegate?.signUpTapped()
    }
    
    @objc private func didTapForgotPassword() {
        delegate?.forgotPasswordTapped()
    }
    @objc private func didTapSignIn() {
        delegate?.signInButtonTapped()
    }
    
    @objc private func didTapGoogleSignIn() {
        delegate?.googleSignInButtonTapped()
    }
}
