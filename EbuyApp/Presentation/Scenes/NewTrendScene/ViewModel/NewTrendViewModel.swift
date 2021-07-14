//
//  NewTrendViewModel.swift
//  EbuyApp
//
//  Created by Nana Jimsheleishvili on 13.07.21.
//

import Foundation

protocol NewTrendViewModelProtocol{
    
    var controller: CoordinatorDelegate { get }
    
    init(controller: CoordinatorDelegate)
}

final class NewTrendViewModel: NewTrendViewModelProtocol{
    
    private(set) var controller: CoordinatorDelegate
    
    init(controller: CoordinatorDelegate) {
        self.controller = controller
    }
}
