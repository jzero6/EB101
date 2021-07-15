//
//  HomeCollectionViewModel.swift
//  EbuyApp
//
//  Created by Nana Jimsheleishvili on 15.07.21.
//

import Foundation

protocol HomeCollectionViewModelProtocol{
    
    func fetchSomeProducts(completion: @escaping ((Result<[SomeProductsModel], Error>) -> Void))
    
    func fetchRecentlyProducts(completion: @escaping ((Result<[RecentlyViewedModel], Error>) -> Void))
    
    func fetchSavedProducts(completion: @escaping ((Result<[SavedItemsModel], Error>) -> Void))
    
    func fetchBrandsProducts(completion: @escaping ((Result<[BrandsUMayLikeModel], Error>) -> Void))
    
    func fetchStylesProducts(completion: @escaping ((Result<[StylesBasedModel], Error>) -> Void))
    
    var coordinator: CoordinatorProtocol { get }
    
    init(coordinator: CoordinatorProtocol)
}

final class HomeCollectionViewModel: HomeCollectionViewModelProtocol{
    
    private(set) var coordinator: CoordinatorProtocol
    
    init(coordinator: CoordinatorProtocol) {
        self.coordinator = coordinator
    }
    
    func fetchSomeProducts(completion: @escaping ((Result<[SomeProductsModel], Error>) -> Void)){
        coordinator.someProductsManager?.fetchProducts(completion: completion)
    }
    
    func fetchRecentlyProducts(completion: @escaping ((Result<[RecentlyViewedModel], Error>) -> Void)){
        coordinator.recentlyViewedManager?.fetchProducts(completion: completion)
    }
    
    func fetchSavedProducts(completion: @escaping ((Result<[SavedItemsModel], Error>) -> Void)){
        coordinator.savedItemsManager?.fetchProducts(completion: completion)
    }
    
    func fetchBrandsProducts(completion: @escaping ((Result<[BrandsUMayLikeModel], Error>) -> Void)){
        coordinator.brandsUMayLikeManager?.fetchProducts(completion: completion)
    }
    
    func fetchStylesProducts(completion: @escaping ((Result<[StylesBasedModel], Error>) -> Void)){
        coordinator.stylesBasedManager?.fetchProducts(completion: completion)
    }
}
