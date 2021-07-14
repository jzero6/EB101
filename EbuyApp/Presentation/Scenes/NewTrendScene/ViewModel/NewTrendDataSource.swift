//
//  NewTrendDataSource.swift
//  EbuyApp
//
//  Created by Nana Jimsheleishvili on 13.07.21.
//

import UIKit

class NewTrendDataSource: NSObject, UICollectionViewDataSource{
    
    // MARK: - Private properties
    private var collectionView: UICollectionView!
    private var viewModel: NewTrendViewModelProtocol!
    private var products = [ProductModel]()
    
    init(with collectionView: UICollectionView, products: [ProductModel], viewModel: NewTrendViewModelProtocol) {
        super.init()
        
        self.products = products
        self.viewModel = viewModel
        self.collectionView = collectionView
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.deque(NewTrendCell.self, for: indexPath)
        cell.configure(with: products[indexPath.row])
        return cell
    }
}

extension NewTrendDataSource: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}
