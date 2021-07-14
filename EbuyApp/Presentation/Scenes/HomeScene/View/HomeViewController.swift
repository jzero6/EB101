//
//  HomeViewController.swift
//  EbuyApp
//
//  Created by Nana Jimsheleishvili on 13.07.21.
//

import UIKit

class HomeViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var dataSource: HomeDataSource!
    private var viewModel:  HomeViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        setupLayout()
        configureViewModel()
    }

    private func setupLayout() {
        tableView.registerNib(class: NewTrendsCell.self)
        tableView.registerNib(class: SomeProductsCell.self)
        tableView.registerNib(class: RecentlyViewedCell.self)
        tableView.registerNib(class: SavedItemsCell.self)
        tableView.registerNib(class: BrandsUMayLikeCell.self)
        tableView.registerNib(class: StylesBasedCell.self)
    }
    
    private func configureViewModel() {
        viewModel = HomeViewModel(controller: self)
        dataSource = HomeDataSource(with: tableView, viewModel: viewModel)
        dataSource.refresh()
    }
}
