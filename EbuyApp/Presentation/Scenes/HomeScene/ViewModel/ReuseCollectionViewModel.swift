//
//  SomeProductsViewModel.swift
//  EbuyApp
//
//  Created by Nana Jimsheleishvili on 13.07.21.
//

import Foundation

protocol ReuseCollectionViewModelProtocol{
    
    var coordinator: CoordinatorProtocol { get }
    
    init(coordinator: CoordinatorProtocol)
}

final class ReuseCollectionViewModel: ReuseCollectionViewModelProtocol{
    
    private(set) var coordinator: CoordinatorProtocol
    
    init(coordinator: CoordinatorProtocol) {
        self.coordinator = coordinator
    }
}
