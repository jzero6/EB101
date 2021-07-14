//
//  TabBarController.swift
//  EbuyApp
//
//  Created by Nana Jimsheleishvili on 13.07.21.
//

import UIKit

class TabBarController: UITabBarController, Storyboarded, CoordinatorDelegate  {

    private var homeCoordinator = HomeCoordinator()
    private var favouritesCoordinator = FavouritesCoordinator()
    
    var coordinator: CoordinatorProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.viewControllers![0] = homeCoordinator.navigationController!
        self.viewControllers![3] = favouritesCoordinator.navigationController!
    }
    
}
