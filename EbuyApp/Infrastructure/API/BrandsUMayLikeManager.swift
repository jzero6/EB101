//
//  BrandsUMayLikeManager.swift
//  EbuyApp
//
//  Created by Nana Jimsheleishvili on 14.07.21.
//

import Foundation

protocol BrandsUMayLikeManagerProtocol: AnyObject {
    func fetchProducts(completion: @escaping ((Result<[BrandsUMayLikeModel], Error>) -> Void))
}

class BrandsUMayLikeManager: BrandsUMayLikeManagerProtocol {
    func fetchProducts(completion: @escaping ((Result<[BrandsUMayLikeModel], Error>) -> Void)) {
        let url = "https://run.mocky.io/v3/4360e4a1-8f87-4bb0-9bfc-fa381e4cc822?fbclid=IwAR3ZN0tmn1nwhW3GfUtjJLMAKLmGQbBa7WkvPKcwxdsZ8IwJZTuXXoe9bZE"
        NetworkManager.shared.get(url: url) { (result: Result<[BrandsUMayLikeModel], Error>) in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let err):
                completion(.failure(err))
            }
        }
    }
}
