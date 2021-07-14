//
//  FavouritesManager.swift
//  EbuyApp
//
//  Created by Nana Jimsheleishvili on 14.07.21.
//

import Foundation

protocol FavouritesManagerProtocol: AnyObject {
    func fetchProducts(completion: @escaping ((Result<[FavouritesModel], Error>) -> Void))
}

class FavouritesManager: FavouritesManagerProtocol {
    func fetchProducts(completion: @escaping ((Result<[FavouritesModel], Error>) -> Void)) {
        let url = "https://run.mocky.io/v3/609e9f8d-acb0-4079-99fb-cd7c78e37d15"
        NetworkManager.shared.get(url: url) { (result: Result<[FavouritesModel], Error>) in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let err):
                completion(.failure(err))
            }
        }
    }
}
