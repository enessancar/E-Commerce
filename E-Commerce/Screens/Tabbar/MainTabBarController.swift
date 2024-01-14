//
//  MainTabBarController.swift
//  E-Commerce
//
//  Created by Enes Sancar on 11.01.2024.
//

import UIKit

final class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    private func setupTabBar() {
        tabBar.tintColor = .label
        tabBar.unselectedItemTintColor = .systemGray
        
        viewControllers = [
            createNavController(for: HomeVC(), title: "Home", imageName: "house", selectedImage: UIImage(systemName: "house.fill")),
            createNavController(for: SearchVC(), title: "Search", imageName: "magnifyingglass"),
            createNavController(for: CartVC(), title: "Cart", imageName: "cart", selectedImage: UIImage(systemName: "cart.fill")),
            createNavController(for: ProfileVC(), title: "Profile", imageName: "person", selectedImage: UIImage(systemName: "person.fill"))
        ]
    }
        
    fileprivate func createNavController(for viewController: UIViewController, title: String, imageName: String, selectedImage: UIImage? = nil) -> UIViewController {
        
        let navController = UINavigationController(rootViewController: viewController)
        navController.navigationBar.prefersLargeTitles = true
        viewController.navigationItem.title = title
        viewController.view.backgroundColor = .systemBackground
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(systemName: imageName)
        navController.tabBarItem.selectedImage = selectedImage
        return navController
    }
}
