//
//  RecentlyViewedManager.swift
//  EbuyApp
//
//  Created by Nana Jimsheleishvili on 14.07.21.
//

import Foundation

protocol RecentlyViewedManagerProtocol: AnyObject {
    func fetchProducts(completion: @escaping ((Result<[RecentlyViewedModel], Error>) -> Void))
}

class RecentlyViewedManager: RecentlyViewedManagerProtocol {
    func fetchProducts(completion: @escaping ((Result<[RecentlyViewedModel], Error>) -> Void)) {
        let url = "https://run.mocky.io/v3/128ee9b1-c6b2-4815-b78c-b07a8956c936?fbclid=IwAR34XPUTxZcpPSgxzzl--bC_gSBs4Mw-ukMfrq8UknUM2TWqA6Ka1F7C2sw"
        NetworkManager.shared.get(url: url) { (result: Result<[RecentlyViewedModel], Error>) in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let err):
                completion(.failure(err))
            }
        }
    }
}
