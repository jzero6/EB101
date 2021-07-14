//
//  FilterDataSource.swift
//  EbuyApp
//
//  Created by Nana Jimsheleishvili on 13.07.21.
//

import UIKit

class FilterDataSource: NSObject, UITableViewDataSource{
    
    private var tableView: UITableView!
    private var viewModel: FilterViewModelProtocol!
    private var filterList = ["Gender", "Product type", "Style", "Leather / Non Leather", "Color", "Brand", "Body fit", "Size", "Price"]
    
    init(with tableView: UITableView, viewModel: FilterViewModelProtocol) {
        super.init()
        
        self.tableView = tableView
        self.viewModel = viewModel
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.deque(FilterCell.self, for: indexPath)
        if indexPath.row == 8 {
            cell.configure(with: filterList[indexPath.row], allButton: "$8 - $316")
        } else {
            cell.configure(with: filterList[indexPath.row], allButton: "All")
        }
        return cell
    }
}

extension FilterDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
