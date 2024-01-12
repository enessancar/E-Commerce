//
//  SceneDelegate.swift
//  E-Commerce
//
//  Created by Enes Sancar on 7.01.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
         
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        if ApplicationVariables.currentUserID != nil {
            let tabBar = MainTabBarController()
            tabBar.modalPresentationStyle = .fullScreen
            window?.rootViewController = tabBar
        } else {
            let loginVC = UINavigationController(rootViewController: LoginVC())
            window?.rootViewController = loginVC
        }
        self.window?.makeKeyAndVisible()
    }
}

