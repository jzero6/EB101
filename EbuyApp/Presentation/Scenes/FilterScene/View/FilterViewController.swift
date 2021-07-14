//
//  FilterViewController.swift
//  EbuyApp
//
//  Created by Nana Jimsheleishvili on 13.07.21.
//

import UIKit

class FilterViewController: BaseViewController {

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    private var dataSource: FilterDataSource!
    private var viewModel:  FilterViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bgView.setupShadow(UIView: bgView, ViewCornerRadius: 10, shadowOffSet: CGSize(width: 0, height: 2), opacity: 0.1, shadowRadius: 4)
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        setupLayout()
        configureViewModel()
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        coordinator?.getBack()
    }
    @IBAction func viewItemsButton(_ sender: Any) {
        coordinator?.getBack()
    }
    
    private func setupLayout() {
        tableView.registerNib(class: FilterCell.self)
    }
    
    private func configureViewModel() {
        viewModel = FilterViewModel(controller: self)
        dataSource = FilterDataSource(with: tableView, viewModel: viewModel)
    }
}
