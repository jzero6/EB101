//
//  SomeProductsManager.swift
//  EbuyApp
//
//  Created by Nana Jimsheleishvili on 14.07.21.
//

import Foundation

protocol SomeProductsManagerProtocol: AnyObject {
    func fetchProducts(completion: @escaping ((Result<[SomeProductsModel], Error>) -> Void))
}

class SomeProductsManager: SomeProductsManagerProtocol {
    func fetchProducts(completion: @escaping ((Result<[SomeProductsModel], Error>) -> Void)) {
        let url = "https://run.mocky.io/v3/9ef77129-0d86-4023-b1e7-64571f1c8a4b?fbclid=IwAR3RqcgJrQu2qgCeNqB51Fbk-NUhnZwoca9FyT7rBRc4y6c5xyQKQDnXcuk"
        NetworkManager.shared.get(url: url) { (result: Result<[SomeProductsModel], Error>) in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let err):
                completion(.failure(err))
            }
        }
    }
}
