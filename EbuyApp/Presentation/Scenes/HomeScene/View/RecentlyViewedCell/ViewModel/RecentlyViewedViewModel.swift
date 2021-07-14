//
//  RecentlyViewedViewModel.swift
//  EbuyApp
//
//  Created by Nana Jimsheleishvili on 14.07.21.
//

import Foundation

protocol RecentlyViewedViewModelProtocol{
    
    func fetchProducts(completion: @escaping ((Result<[RecentlyViewedModel], Error>) -> Void))
    
    var coordinator: CoordinatorProtocol { get }
    
    init(coordinator: CoordinatorProtocol)
}

final class RecentlyViewedViewModel: RecentlyViewedViewModelProtocol{
    
    private(set) var coordinator: CoordinatorProtocol
    
    init(coordinator: CoordinatorProtocol) {
        self.coordinator = coordinator
    }
    
    func fetchProducts(completion: @escaping ((Result<[RecentlyViewedModel], Error>) -> Void)){
        coordinator.recentlyViewedManager?.fetchProducts(completion: completion)
    }
}
