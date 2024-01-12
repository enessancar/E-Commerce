//
//  ForgotPasswordVC.swift
//  E-Commerce
//
//  Created by Enes Sancar on 11.01.2024.
//

import UIKit
import SnapKit

final class ForgotPasswordVC: UIViewController {
    
    private let forgotPasswordView = ForgotPasswordView()
    private lazy var viewModel     = AuthViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.setHidesBackButton(true, animated: true)
        setupView()
    }
    
    private func setupView() {
        view.addSubview(forgotPasswordView)
        forgotPasswordView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        forgotPasswordView.delegate = self
    }
}

extension ForgotPasswordVC: ForgotPasswordViewProtocol {
    func forgotPasswordTapped() {
        guard let email =  forgotPasswordView.emailTextField.text else {
            return
        }
        
        guard email.isValidEmail(email: email) else {
            presentAlert(title: "Alert", message: "Invalid email adress", buttonTitle: "Ok")
            return
        }
        
        viewModel.resetPassword(email: email) { [weak self] success, message in
            guard let self else { return }
            
            if success {
                presentAlert(title: "Success", message: message, buttonTitle: "Ok")
                navigationController?.popToRootViewController(animated: true)
            } else {
                presentAlert(title: "Error", message: message, buttonTitle: "Ok")
            }
        }
    }
    
    func signInTapped() {
        navigationController?.popToRootViewController(animated: true)
    }
}
