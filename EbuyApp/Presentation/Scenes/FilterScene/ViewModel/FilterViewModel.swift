//
//  FilterViewModel.swift
//  EbuyApp
//
//  Created by Nana Jimsheleishvili on 13.07.21.
//

import Foundation

protocol FilterViewModelProtocol{
    
    var controller: CoordinatorDelegate { get }
    
    init(controller: CoordinatorDelegate)
    
}

final class FilterViewModel: FilterViewModelProtocol{
    
    private(set) var controller: CoordinatorDelegate
    
    init(controller: CoordinatorDelegate) {
        self.controller = controller
    }
    
}
