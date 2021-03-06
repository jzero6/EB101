//
//  HomeCoordinator.swift
//  EbuyApp
//
//  Created by Nana Jimsheleishvili on 13.07.21.
//

import UIKit

final class HomeCoordinator: CoordinatorProtocol {

    var productsManager: ProductsManagerProtocol?
    var someProductsManager: SomeProductsManagerProtocol?
    var recentlyViewedManager: RecentlyViewedManagerProtocol?
    var savedItemsManager: SavedItemsManagerProtocol?
    var brandsUMayLikeManager: BrandsUMayLikeManagerProtocol?
    var stylesBasedManager: StylesBasedManagerProtocol? 
    var navigationController: UINavigationController?
    
    init(_ window: UIWindow? = nil, navigationController: UINavigationController? = UINavigationController()) {
        self.navigationController = navigationController
        self.navigationController?.isNavigationBarHidden = true
        
        let vc = HomeViewController.instantiateFromStoryboard()
        vc.coordinator = self
        self.navigationController?.viewControllers = [vc]
        productsManager = ProductsManager()
        someProductsManager = SomeProductsManager()
        recentlyViewedManager = RecentlyViewedManager()
        savedItemsManager = SavedItemsManager()
        brandsUMayLikeManager = BrandsUMayLikeManager()
        stylesBasedManager = StylesBasedManager()
    }

    func start() {}
    func getBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func proceedToCardVC(){
        let vc = CardViewController.instantiateFromStoryboard()
        vc.coordinator = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func proceedToNewTrendVC(with products: [ProductModel], coordinator: CoordinatorProtocol){
        let vc = NewTrendViewController.instantiateFromStoryboard()
        vc.configure(with: products, coordinator: coordinator)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func proceedToFilterVC(){
        let vc = FilterViewController.instantiateFromStoryboard()
        vc.coordinator = self
        navigationController?.present(vc, animated: true, completion: nil)
    }
    
    func proceedToFavouritesVC(){
        let vc = NewTrendViewController.instantiateFromStoryboard()
        vc.coordinator = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
