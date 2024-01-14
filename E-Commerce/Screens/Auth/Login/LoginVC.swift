//
//  LoginVC.swift
//  E-Commerce
//
//  Created by Enes Sancar on 9.01.2024.
//

import UIKit
import SnapKit
import Firebase
import FirebaseAuth
import GoogleSignIn

final class LoginVC: UIViewController {
    
    private let loginView = LoginView()
    private let viewModel = AuthViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.addSubview(loginView)
        loginView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        loginView.delegate = self
    }
}

extension LoginVC: LoginViewProtocol {
    
    func signUpTapped() {
        let vc = RegisterVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func forgotPasswordTapped() {
        let vc = ForgotPasswordVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func googleSignInButtonTapped() {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { [unowned self] result, error in
            guard error == nil else {
                return
            }
            
            guard let user = result?.user,
                  let idToken = user.idToken?.tokenString,
                  let userName: String = user.profile?.name
            else {
                return
            }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                           accessToken: user.accessToken.tokenString)
            viewModel.signInGoogle(credential: credential,username: userName) {[weak self] in
                guard let self else { return }
                
                let mainTabBar = MainTabBarController()
                self.view.window?.rootViewController = mainTabBar
            }
        }
    }
    
    func signInButtonTapped() {
        guard let email = loginView.emailTextField.text,
              let password = loginView.passwordTextField.text else{
            presentAlert(title: "Alert!", message: "Email and Password ?", buttonTitle: "Ok")
            return
        }
        
        guard email.isValidEmail(email: email) else {
            presentAlert(title: "Alert!", message: "Email Invalid", buttonTitle: "Ok")
            return
        }
        
        viewModel.login(email: email, password: password) { [weak self] in
            guard let self else { return }
            presentAlert(title: "Alert!", message: "Entry Successful 🥳", buttonTitle: "Ok")
            let mainTabBar = MainTabBarController()
            self.view.window?.rootViewController = mainTabBar
        }
    }
}
