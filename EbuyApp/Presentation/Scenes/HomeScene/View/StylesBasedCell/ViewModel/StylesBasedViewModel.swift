//
//  StyledBasedViewModel.swift
//  EbuyApp
//
//  Created by Nana Jimsheleishvili on 14.07.21.
//

import Foundation

protocol StylesBasedViewModelProtocol{
    
    func fetchProducts(completion: @escaping ((Result<[StylesBasedModel], Error>) -> Void))
    
    var coordinator: CoordinatorProtocol { get }
    
    init(coordinator: CoordinatorProtocol)
}

final class StylesBasedViewModel: StylesBasedViewModelProtocol{
    
    private(set) var coordinator: CoordinatorProtocol
    
    init(coordinator: CoordinatorProtocol) {
        self.coordinator = coordinator
    }
    
    func fetchProducts(completion: @escaping ((Result<[StylesBasedModel], Error>) -> Void)){
        coordinator.stylesBasedManager?.fetchProducts(completion: completion)
    }
}
