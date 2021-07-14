//
//  SomeProductsViewModel.swift
//  EbuyApp
//
//  Created by Nana Jimsheleishvili on 14.07.21.
//

import Foundation

protocol SomeProductsViewModelProtocol{
    
    func fetchProducts(completion: @escaping ((Result<[SomeProductsModel], Error>) -> Void))
    
    var coordinator: CoordinatorProtocol { get }
    
    init(coordinator: CoordinatorProtocol)
}

final class SomeProductsViewModel: SomeProductsViewModelProtocol{
    
    private(set) var coordinator: CoordinatorProtocol
    
    init(coordinator: CoordinatorProtocol) {
        self.coordinator = coordinator
    }
    
    func fetchProducts(completion: @escaping ((Result<[SomeProductsModel], Error>) -> Void)){
        coordinator.someProductsManager?.fetchProducts(completion: completion)
    }
}
