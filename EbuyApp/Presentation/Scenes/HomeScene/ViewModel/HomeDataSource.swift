//
//  HomeDataSource.swift
//  EbuyApp
//
//  Created by Nana Jimsheleishvili on 13.07.21.
//

import UIKit

class HomeDataSource: NSObject, UITableViewDataSource{
    
    private var tableView: UITableView!
    private var viewModel: HomeViewModelProtocol!
    private var products = [ProductModel]()
    
    init(with tableView: UITableView, viewModel: HomeViewModelProtocol) {
        super.init()
        
        self.tableView = tableView
        self.viewModel = viewModel
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    func refresh() {
        viewModel.fetchProducts { [weak self] result in
            switch result {
            case .success(let products):
                self?.products = products
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let err):
                print(err)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.deque(NewTrendsCell.self, for: indexPath)
            cell.configure(image: UIImage(named: "imageGirlFlower")!, title: "NEW TREND")
            return cell
        }
        if indexPath.row == 1 {
            let cell = tableView.deque(SomeProductsCell.self, for: indexPath)
            cell.configure(with: products, coordinator: viewModel.controller.coordinator!)
            return cell
        }
        if indexPath.row == 2 {
            let cell = tableView.deque(NewTrendsCell.self, for: indexPath)
            cell.configure(image: UIImage(named: "imageBoyGray")!, title: "SRIPPES")
            return cell
        }
        if indexPath.row == 3 {
            let cell = tableView.deque(NewTrendsCell.self, for: indexPath)
            cell.configure(image: UIImage(named: "imageGirlFlower")!, title: "HOT TREND")
            return cell
        }
        if indexPath.row == 4 {
            let cell = tableView.deque(NewTrendsCell.self, for: indexPath)
            cell.configure(image: UIImage(named: "imageGirlFlower")!, title: "SUMMER SEA")
            return cell
        }
        if indexPath.row == 5 {
            let cell = tableView.deque(RecentlyViewedCell.self, for: indexPath)
            cell.configure(with: products, coordinator: viewModel.controller.coordinator!)
            return cell
        }
        if indexPath.row == 6 {
            let cell = tableView.deque(SavedItemsCell.self, for: indexPath)
            cell.configure(with: products, coordinator: viewModel.controller.coordinator!)
            return cell
        }
        if indexPath.row == 7 {
            let cell = tableView.deque(BrandsUMayLikeCell.self, for: indexPath)
            cell.configure(with: products, coordinator: viewModel.controller.coordinator!)
            return cell
        }
        if indexPath.row == 8 {
            let cell = tableView.deque(StylesBasedCell.self, for: indexPath)
            cell.configure(with: products, coordinator: viewModel.controller.coordinator!)
            return cell
        }
        return .init()
    }
}


extension HomeDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        if indexPath.row == 0 {
            viewModel.controller.coordinator?.proceedToNewTrendVC(with: products, coordinator: viewModel.controller.coordinator!)
            
        }
    }
}

