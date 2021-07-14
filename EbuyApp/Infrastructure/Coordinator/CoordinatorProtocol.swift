//
//  CoordinatorProtocol.swift
//  EbuyApp
//
//  Created by Nana Jimsheleishvili on 13.07.21.
//

import UIKit

protocol CoordinatorProtocol: AnyObject {
    
    var productsManager: ProductsManagerProtocol? { get }
    
    init(_ window: UIWindow?, navigationController: UINavigationController?)
    
    func start()
    func getBack()
    func proceedToCardVC()
    func proceedToNewTrendVC(with products: [ProductModel], coordinator: CoordinatorProtocol)
    func ProceedToFilterVC()
}

extension CoordinatorProtocol {
    var productsManager: ProductsManagerProtocol? {
        set { print("") }
        get { nil }
    }
    
    func getBack(){}
    func proceedToNewTrendVC(with products: [ProductModel], coordinator: CoordinatorProtocol){}
    func proceedToCardVC(){}
    func ProceedToFilterVC(){}
}
