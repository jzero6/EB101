//
//  SavedItemsManager.swift
//  EbuyApp
//
//  Created by Nana Jimsheleishvili on 14.07.21.
//

import Foundation

protocol SavedItemsManagerProtocol: AnyObject {
    func fetchProducts(completion: @escaping ((Result<[SavedItemsModel], Error>) -> Void))
}

class SavedItemsManager: SavedItemsManagerProtocol {
    func fetchProducts(completion: @escaping ((Result<[SavedItemsModel], Error>) -> Void)) {
        let url = "https://run.mocky.io/v3/3b06cd4c-0486-4758-9446-ca66bdb04c72?fbclid=IwAR2om60EhZrxHtVa_O5FDrXzf0lOlqtMRQAG7sgrwRDyC4-mblYO_GX3F2M"
        NetworkManager.shared.get(url: url) { (result: Result<[SavedItemsModel], Error>) in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let err):
                completion(.failure(err))
            }
        }
    }
}
