//
//  HomeCollectionViewDataSource.swift
//  EbuyApp
//
//  Created by Nana Jimsheleishvili on 15.07.21.
//

import UIKit

final class HomeCollectionViewDataSource: BaseCollectionViewDataSource {
    
    var viewModel: HomeCollectionViewModelProtocol!
    
    init(with collectionView: UICollectionView, viewModel: HomeCollectionViewModelProtocol!) {
        super.init()
        
        self.collectionView = collectionView
        self.viewModel = viewModel
        
        singleSectionModels = []
    }
    
    func refreshSomeProducts(){
        viewModel.fetchSomeProducts { [unowned self] result  in
            switch result {
            case .success(let products):
                DispatchQueue.main.async {
                    for product in products {
                        self.singleSectionModels.append(self.someProductsItemCell(data: product))
                    }
                    self.collectionView?.reloadData()
                }
            case .failure(let err):
                print(err)
            }
        }
    }
    func refreshRecentlyProducts(){
        viewModel.fetchRecentlyProducts { [unowned self] result  in
            switch result {
            case .success(let products):
                DispatchQueue.main.async {
                    for product in products {
                        self.singleSectionModels.append(self.recentlyViewedItemCell(data: product))
                    }
                    self.collectionView?.reloadData()
                }
            case .failure(let err):
                print(err)
            }
        }
    }
    func refreshSavedProducts(){
        viewModel.fetchSavedProducts { [unowned self] result  in
            switch result {
            case .success(let products):
                DispatchQueue.main.async {
                    for product in products {
                        self.singleSectionModels.append(self.savedItemsItemCell(data: product))
                    }
                    self.collectionView?.reloadData()
                }
            case .failure(let err):
                print(err)
            }
        }
    }
    func refreshBrandsProducts(){
        viewModel.fetchBrandsProducts { [unowned self] result  in
            switch result {
            case .success(let products):
                DispatchQueue.main.async {
                    for product in products {
                        self.singleSectionModels.append(self.brandsUMayLikeItemCell(data: product))
                    }
                    self.collectionView?.reloadData()
                }
            case .failure(let err):
                print(err)
            }
        }
    }
    func refreshStylesProducts(){
        viewModel.fetchStylesProducts { [unowned self] result  in
            switch result {
            case .success(let products):
                DispatchQueue.main.async {
                    for product in products {
                        self.singleSectionModels.append(self.stylesBasedItemCell(data: product))
                    }
                    self.collectionView?.reloadData()
                }
            case .failure(let err):
                print(err)
            }
        }
    }
}

// MARK: - CollectionView Cells
private extension HomeCollectionViewDataSource {
    
    private func someProductsItemCell(data: SomeProductsModel) -> CellViewModel {
        return CellViewModel(cellIdentifier: SomeProductsItemCell.identifier,
                             userData: [.data: data])
    }

    private func recentlyViewedItemCell(data: RecentlyViewedModel) -> CellViewModel {
        return CellViewModel(cellIdentifier: RecentlyViewedItemCell.identifier,
                             userData: [.data: data])
    }

    private func savedItemsItemCell(data: SavedItemsModel) -> CellViewModel {
        return CellViewModel(cellIdentifier: SavedItemsItemCell.identifier,
                             userData: [.data: data])
    }

    private func brandsUMayLikeItemCell(data: BrandsUMayLikeModel) -> CellViewModel {
        return CellViewModel(cellIdentifier: BrandsUMayLikeItemCell.identifier,
                             userData: [.data: data])
    }

    private func stylesBasedItemCell(data: StylesBasedModel) -> CellViewModel {
        return CellViewModel(cellIdentifier: StylesBasedItemCell.identifier,
                             userData: [.data: data])
    }

}
