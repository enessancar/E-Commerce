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
    
    var image: UIImage {
        switch self {
        case .all:
            UIImage(named: "allCategories")!
        case .electronics:
            UIImage(named: "men")!
        case .jewelery:
            UIImage(named: "jewelery")!
        case .menSClothing:
            UIImage(named: "men")!
        case .womenSClothing:
            UIImage(named: "women")!
        }
    }
}

// MARK: - Rating
struct Rating: Codable {
    let rate: Double?
    let count: Int?
}
