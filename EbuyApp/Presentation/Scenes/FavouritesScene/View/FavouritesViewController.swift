//
//  FavouritesViewController.swift
//  EbuyApp
//
//  Created by Nana Jimsheleishvili on 13.07.21.
//

import UIKit

class FavouritesViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!

    private var dataSource: FavouritesDataSource!
    private var viewModel:  FavouritesViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        setupLayout()
        configureViewModel()
    }
    
    @IBAction func allItemsButton(_ sender: Any) {
    }
    @IBAction func boardsButton(_ sender: Any) {
    }
    @IBAction func cardButton(_ sender: Any) {
    }
    @IBAction func backButton(_ sender: Any) {
    }
    
    
    private func setupLayout() {
        tableView.registerNib(class: FavouritesCell.self)
    }
    
    private func configureViewModel() {
        viewModel = FavouritesViewModel(controller: self)
        dataSource = FavouritesDataSource(with: tableView, viewModel: viewModel)
        dataSource.refresh()
    }

}
