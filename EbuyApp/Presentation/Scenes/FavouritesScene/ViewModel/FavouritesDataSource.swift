//
//  FavouritesDataSource.swift
//  EbuyApp
//
//  Created by Nana Jimsheleishvili on 14.07.21.
//

import UIKit

class FavouritesDataSource: NSObject, UITableViewDataSource{
    
    private var tableView: UITableView!
    private var viewModel: FavouritesViewModelProtocol!
    private var products = [FavouritesModel]()
    
    init(with tableView: UITableView, viewModel: FavouritesViewModelProtocol) {
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
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.deque(FavouritesCell.self, for: indexPath)
        cell.configure(with: products[indexPath.row])
        return cell
    }
}


extension FavouritesDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}

