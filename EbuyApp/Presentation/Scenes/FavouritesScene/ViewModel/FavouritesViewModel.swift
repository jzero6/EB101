//
//  FavouritesViewModel.swift
//  EbuyApp
//
//  Created by Nana Jimsheleishvili on 14.07.21.
//

import Foundation

protocol FavouritesViewModelProtocol {
    
    func fetchProducts(completion: @escaping ((Result<[FavouritesModel], Error>) -> Void))
    
    var controller: CoordinatorDelegate { get }
    
    init(controller: CoordinatorDelegate)
}

final class FavouritesViewModel: FavouritesViewModelProtocol {
    
    private(set) var controller: CoordinatorDelegate
    
    init(controller: CoordinatorDelegate) {
        self.controller = controller
    }
    
    func fetchProducts(completion: @escaping ((Result<[FavouritesModel], Error>) -> Void)){
        controller.coordinator?.favouritesManager?.fetchProducts(completion: completion)
    }
}
