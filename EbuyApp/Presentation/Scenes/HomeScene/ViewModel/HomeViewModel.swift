//
//  HomeViewModel.swift
//  EbuyApp
//
//  Created by Nana Jimsheleishvili on 13.07.21.
//

import Foundation

protocol HomeViewModelProtocol {
    
    func fetchProducts(completion: @escaping ((Result<[ProductModel], Error>) -> Void))
    
    var controller: CoordinatorDelegate { get }
    
    init(controller: CoordinatorDelegate)
}

final class HomeViewModel: HomeViewModelProtocol {
    
    private(set) var controller: CoordinatorDelegate
    
    init(controller: CoordinatorDelegate) {
        self.controller = controller
    }
    
    func fetchProducts(completion: @escaping ((Result<[ProductModel], Error>) -> Void)){
        controller.coordinator?.productsManager?.fetchProducts(completion: completion)
    }
}
