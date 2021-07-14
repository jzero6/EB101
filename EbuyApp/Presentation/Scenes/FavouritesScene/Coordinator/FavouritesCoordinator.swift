//
//  FavouritesCoordinator.swift
//  EbuyApp
//
//  Created by Nana Jimsheleishvili on 14.07.21.
//

import UIKit

final class FavouritesCoordinator: CoordinatorProtocol {

    var favouritesManager: FavouritesManagerProtocol?
    var navigationController: UINavigationController?
    
    init(_ window: UIWindow? = nil, navigationController: UINavigationController? = UINavigationController()) {
        self.navigationController = navigationController
        self.navigationController?.isNavigationBarHidden = true
        
        let vc = FavouritesViewController.instantiateFromStoryboard()
        vc.coordinator = self
        self.navigationController?.viewControllers = [vc]
        favouritesManager = FavouritesManager()
    }

    func start() {}
    func getBack() {
        self.navigationController?.popViewController(animated: true)
    }
}
