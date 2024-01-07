//
//  AlamofireService.swift
//  E-Commerce
//
//  Created by Enes Sancar on 7.01.2024.
//

import Alamofire

protocol AlamofireServiceProtocol {
    func request<T: Codable>(path: String, onSuccess: @escaping(T) -> (), onError: @escaping (AFError) -> ())
}

final class AlamofireService: AlamofireServiceProtocol {
    static let shared = AlamofireService()
    
    private init() {}
    
    func request<T: Codable>(path: String, onSuccess: @escaping(T) -> (), onError: @escaping (AFError) -> ()) {
        AF.request(path).validate().responseDecodable(of: T.self) { response in
            if let error = response.error {
                onError(error)
            }
            guard let model = response.value else {
                return
            }
            onSuccess(model)
        }
    }
}
