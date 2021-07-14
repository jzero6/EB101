//
//  SavedItemsViewModel.swift
//  EbuyApp
//
//  Created by Nana Jimsheleishvili on 14.07.21.
//

import Foundation

protocol SavedItemsViewModelProtocol{
    
    func fetchProducts(completion: @escaping ((Result<[SavedItemsModel], Error>) -> Void))
    
    var coordinator: CoordinatorProtocol { get }
    
    init(coordinator: CoordinatorProtocol)
}

final class SavedItemsViewModel: SavedItemsViewModelProtocol{
    
    private(set) var coordinator: CoordinatorProtocol
    
    init(coordinator: CoordinatorProtocol) {
        self.coordinator = coordinator
    }
    
    func fetchProducts(completion: @escaping ((Result<[SavedItemsModel], Error>) -> Void)){
        coordinator.savedItemsManager?.fetchProducts(completion: completion)
    }
}
