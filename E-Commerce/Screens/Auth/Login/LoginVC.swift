//
//  LoginVC.swift
//  E-Commerce
//
//  Created by Enes Sancar on 9.01.2024.
//

import UIKit
import SnapKit

final class LoginVC: UIViewController {
    
    private let loginView = LoginView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.addSubview(loginView)
        loginView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        //loginView.delegate = self
    }
}
