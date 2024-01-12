//
//  AlertVC.swift
//  E-Commerce
//
//  Created by Enes Sancar on 11.01.2024.
//

import UIKit
import SnapKit

final class AlertVC: UIViewController {
    
    private var alertTitle: String?
    private var message: String?
    private var buttonTitle: String?
    
    private lazy var containerView = AlertContainerView()
    private lazy var titleLabel = TitleLabel(fontSize: 20, textAlignment: .center)
    private lazy var messageLabel  = SecondaryTitleLabel(fontSize: 17, textAlignment: .center)
    private lazy var actionButton = CustomButton(
        bgColor: .systemPink,
        color: .systemPink,
        title: "Ok",
        systemImageName: "checkmark.circle")
    
    init(alertTitle: String? = nil, message: String? = nil, buttonTitle: String? = nil) {
        super.init(nibName: nil, bundle: nil)
        self.alertTitle = alertTitle
        self.message = message
        self.buttonTitle = buttonTitle
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.75)
        configureUI()
    }
    
    private func configureUI() {
        configureContainerView()
        configureTitleLabel()
        configureMessageLabel()
        configureActionButton()
    }
    
    private func configureContainerView() {
        view.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(280)
            make.height.equalTo(220)
        }
    }
    
    private func configureTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.text = alertTitle ?? "Something went wrong"
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp.top).offset(20)
            make.leading.equalTo(containerView.snp.leading).offset(10)
            make.trailing.equalTo(containerView.snp.trailing).offset(-10)
            make.height.equalTo(28)
        }
    }
    
    private func configureMessageLabel() {
        view.addSubview(messageLabel)
        messageLabel.text = message ?? "Unable to complete request"
        messageLabel.numberOfLines  = 4
        
        messageLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.leading.trailing.equalTo(titleLabel)
            make.height.equalTo(90)
        }
    }
    
    private func configureActionButton() {
        view.addSubview(actionButton)
        actionButton.setTitle(buttonTitle ?? "Ok", for: .normal)
        
        let dismissAction = UIAction { [weak self] _ in
            guard let self else { return }
            self.dismissVC()
        }
        actionButton.addAction(dismissAction, for: .touchUpInside)
        
        actionButton.snp.makeConstraints { make in
            make.leading.trailing.equalTo(messageLabel)
            make.bottom.equalTo(containerView.snp.bottom).offset(-20)
            make.height.equalTo(40)
        }
    }
    
    // MARK: - Actions
    @objc private func dismissVC() {
        dismiss(animated: true)
    }
}
