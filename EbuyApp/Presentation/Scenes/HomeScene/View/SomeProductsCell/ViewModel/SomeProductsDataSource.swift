//
//  SomeProductsDataSource.swift
//  EbuyApp
//
//  Created by Nana Jimsheleishvili on 14.07.21.
//

import UIKit

class SomeProductsDataSource: NSObject, UICollectionViewDataSource{
    
    // MARK: - Private properties
    private var collectionView: UICollectionView!
    private var viewModel: SomeProductsViewModelProtocol!
    private var products = [SomeProductsModel]()
    
    init(with collectionView: UICollectionView, viewModel: SomeProductsViewModelProtocol) {
        super.init()
        
        self.viewModel = viewModel
        self.collectionView = collectionView
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
    
    func refresh() {
        viewModel.fetchProducts { [weak self] result in
            switch result {
            case .success(let products):
                self?.products = products
                DispatchQueue.main.async {
                    self?.collectionView.reloadData()
                }
            case .failure(let err):
                print(err)
            }
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.deque(SomeProductsItemCell.self, for: indexPath)
        cell.configure(with: products[indexPath.row])
        return cell
    }
}

extension SomeProductsDataSource: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}
