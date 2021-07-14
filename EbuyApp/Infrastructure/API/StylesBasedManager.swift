//
//  StylesBasedManager.swift
//  EbuyApp
//
//  Created by Nana Jimsheleishvili on 14.07.21.
//

import Foundation

protocol StylesBasedManagerProtocol: AnyObject {
    func fetchProducts(completion: @escaping ((Result<[StylesBasedModel], Error>) -> Void))
}

class StylesBasedManager: StylesBasedManagerProtocol {
    func fetchProducts(completion: @escaping ((Result<[StylesBasedModel], Error>) -> Void)) {
        let url = "https://run.mocky.io/v3/96680335-73f4-4d64-951b-6bf8ca8cfac9?fbclid=IwAR24CHhxPw5X34jUiIiOw_iL7EB5EFPXwHYwl57pBCCzv187EWoTSiaA5YY"
        NetworkManager.shared.get(url: url) { (result: Result<[StylesBasedModel], Error>) in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let err):
                completion(.failure(err))
            }
        }
    }
}
