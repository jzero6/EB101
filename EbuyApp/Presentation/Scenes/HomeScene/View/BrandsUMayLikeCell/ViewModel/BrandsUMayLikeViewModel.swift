//
//  BrandsUMayLikeViewModel.swift
//  EbuyApp
//
//  Created by Nana Jimsheleishvili on 14.07.21.
//

import Foundation

protocol BrandsUMayLikeViewModelProtocol{
    
    func fetchProducts(completion: @escaping ((Result<[BrandsUMayLikeModel], Error>) -> Void))
    
    var coordinator: CoordinatorProtocol { get }
    
    init(coordinator: CoordinatorProtocol)
}

final class BrandsUMayLikeViewModel: BrandsUMayLikeViewModelProtocol{
    
    private(set) var coordinator: CoordinatorProtocol
    
    init(coordinator: CoordinatorProtocol) {
        self.coordinator = coordinator
    }
    
    func fetchProducts(completion: @escaping ((Result<[BrandsUMayLikeModel], Error>) -> Void)){
        coordinator.brandsUMayLikeManager?.fetchProducts(completion: completion)
    }
}
