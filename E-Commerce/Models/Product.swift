//
//  ProductModel.swift
//  E-Commerce
//
//  Created by Enes Sancar on 7.01.2024.
//

import UIKit

struct Product: Codable {
    let id: Int?
    let title: String?
    let price: Double?
    let description: String?
    let category: Category?
    let image: String?
    let rating: Rating?
}

enum Category: String, Codable, CaseIterable {
    case all = "All"
    case electronics = "electronics"
    case jewelery = "jewelery"
    case menSClothing = "men's clothing"
    case womenSClothing = "women's clothing"
    
    var name: String {
        self.rawValue
    }
    
    var image: UIImageView {
        switch self {
        case .all:
            UIImageView(image: .allCategories)
        case .electronics:
            UIImageView(image: .electronics)
        case .jewelery:
            UIImageView(image: .jewelery)
        case .menSClothing:
            UIImageView(image: .men)
        case .womenSClothing:
            UIImageView(image: .women)
        }
    }
}

// MARK: - Rating
struct Rating: Codable {
    let rate: Double?
    let count: Int?
}
