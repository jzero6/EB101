//
//  CoordinatorProtocol.swift
//  EbuyApp
//
//  Created by Nana Jimsheleishvili on 13.07.21.
//

import UIKit

protocol CoordinatorProtocol: AnyObject {
    
    var productsManager: ProductsManagerProtocol? { get }
    var someProductsManager: SomeProductsManagerProtocol? { get }
    var recentlyViewedManager: RecentlyViewedManagerProtocol? { get }
    var savedItemsManager: SavedItemsManagerProtocol? { get }
    var brandsUMayLikeManager: BrandsUMayLikeManagerProtocol? { get }
    var stylesBasedManager: StylesBasedManagerProtocol? { get }
    var favouritesManager: FavouritesManagerProtocol? { get }
    
    init(_ window: UIWindow?, navigationController: UINavigationController?)
    
    func start()
    func getBack()
    func proceedToCardVC()
    func proceedToNewTrendVC(with products: [ProductModel], coordinator: CoordinatorProtocol)
    func proceedToFilterVC()
    func proceedToFavouritesVC()
}

extension CoordinatorProtocol {
    var productsManager: ProductsManagerProtocol? {
        set { print("") }
        get { nil }
    }
    var someProductsManager: SomeProductsManagerProtocol? {
        set { print("") }
        get { nil }
    }
    var recentlyViewedManager: RecentlyViewedManagerProtocol? {
        set { print("") }
        get { nil }
    }
    var savedItemsManager: SavedItemsManagerProtocol? {
        set { print("") }
        get { nil }
    }
    var brandsUMayLikeManager: BrandsUMayLikeManagerProtocol? {
        set { print("") }
        get { nil }
    }
    var stylesBasedManager: StylesBasedManagerProtocol? {
        set { print("") }
        get { nil }
    }
    var favouritesManager: FavouritesManagerProtocol? {
        set { print("") }
        get { nil }
    }
    
    func getBack(){}
    func proceedToNewTrendVC(with products: [ProductModel], coordinator: CoordinatorProtocol){}
    func proceedToCardVC(){}
    func proceedToFilterVC(){}
    func proceedToFavouritesVC(){}
}
