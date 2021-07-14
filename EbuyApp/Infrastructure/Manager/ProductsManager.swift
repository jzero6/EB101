//
//  ProductsManager.swift
//  EbuyApp
//
//  Created by Nana Jimsheleishvili on 13.07.21.
//

import Foundation

protocol ProductsManagerProtocol: AnyObject {
    func fetchProducts(completion: @escaping ((Result<[ProductModel], Error>) -> Void))
}

class ProductsManager: ProductsManagerProtocol {
    func fetchProducts(completion: @escaping ((Result<[ProductModel], Error>) -> Void)) {
        let url = "https://fakestoreapi.com/products"
        NetworkManager.shared.get(url: url) { (result: Result<[ProductModel], Error>) in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let err):
                completion(.failure(err))
            }
        }
    }
}
