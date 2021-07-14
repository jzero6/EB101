//
//  NewTrendViewController.swift
//  EbuyApp
//
//  Created by Nana Jimsheleishvili on 13.07.21.
//

import UIKit

class NewTrendViewController: BaseViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var filterOutlet: UIButton!
    @IBOutlet weak var sortOutlet: UIButton!
    
    
    private var dataSource: NewTrendDataSource!
    private var viewModel: NewTrendViewModelProtocol!
    var products = [ProductModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        setupLayout()
        setUpCollectionView()
        configureDataSource()
    }
    
    @IBAction func backButton(_ sender: Any) {
        coordinator?.getBack()
    }
    @IBAction func cardButton(_ sender: Any) {
        coordinator?.proceedToCardVC()
    }
    @IBAction func filterButton(_ sender: Any) {
        coordinator?.ProceedToFilterVC()
    }
    @IBAction func sortButton(_ sender: Any) {
        
    }
    
    func configure(with products: [ProductModel], coordinator: CoordinatorProtocol) {
        self.products = products
        self.coordinator = coordinator
    }
    
    // MARK: - Setup
    private func setupLayout() {
        collectionView.registerNib(class: NewTrendCell.self)
        filterOutlet.layer.borderWidth = 2
        filterOutlet.layer.borderColor = UIColor(named: "firstColor")!.cgColor
        filterOutlet.layer.cornerRadius = 6
        sortOutlet.layer.borderWidth = 2
        sortOutlet.layer.borderColor = UIColor(named: "firstColor")!.cgColor
        sortOutlet.layer.cornerRadius = 6
    }
    
    private func configureDataSource() {
        viewModel = NewTrendViewModel(controller: self)
        dataSource = NewTrendDataSource(with: collectionView, products: products, viewModel: viewModel)
    }
    
    private func setUpCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: UIScreen.main.bounds.size.width / 2 - 30, height: 170)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 20 , bottom: 0, right: 20)
        collectionView.collectionViewLayout = layout
        collectionView.isPagingEnabled = true
    }
}

extension NewTrendViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.size.width / 2 - 30, height: 170)
    }
}
