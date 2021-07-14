//
//  SomeProductsDataSource.swift
//  EbuyApp
//
//  Created by Nana Jimsheleishvili on 13.07.21.
//

import UIKit

class ReuseCollectionViewDataSource: NSObject, UICollectionViewDataSource{
    
    // MARK: - Private properties
    private var collectionView: UICollectionView!
    private var viewModel: ReuseCollectionViewModelProtocol!
    private var products = [ProductModel]()
    private var cellToDeque: UICollectionViewCell.Type?
    
    init(with collectionView: UICollectionView, products: [ProductModel], viewModel: ReuseCollectionViewModelProtocol, cellToDeque: UICollectionViewCell.Type) {
        super.init()
        
        self.products = products
        self.viewModel = viewModel
        self.cellToDeque = cellToDeque
        self.collectionView = collectionView
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cellToDeque = cellToDeque else {return .init()}
        if cellToDeque == SomeProductsItemCell.self {
            let cell = collectionView.deque(SomeProductsItemCell.self, for: indexPath)
            cell.configure(with: products[indexPath.row])
            return cell
        }
        if cellToDeque == RecentlyViewedItemCell.self {
            let cell = collectionView.deque(RecentlyViewedItemCell.self, for: indexPath)
            cell.configure(with: products[indexPath.row])
            return cell
        }
        if cellToDeque == SavedItemsItemCell.self {
            let cell = collectionView.deque(SavedItemsItemCell.self, for: indexPath)
            cell.configure(with: products[indexPath.row])
            return cell
        }
        if cellToDeque == BrandsUMayLikeItemCell.self {
            let cell = collectionView.deque(BrandsUMayLikeItemCell.self, for: indexPath)
            cell.configure(with: products[indexPath.row])
            return cell
        }
        if cellToDeque == StylesBasedItemCell.self {
            let cell = collectionView.deque(StylesBasedItemCell.self, for: indexPath)
            cell.configure(with: products[indexPath.row])
            return cell
        }
        return .init()
    }
}

extension ReuseCollectionViewDataSource: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}
