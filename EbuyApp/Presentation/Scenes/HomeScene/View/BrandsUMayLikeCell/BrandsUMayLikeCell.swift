//
//  BrandsUMayLikeCell.swift
//  EbuyApp
//
//  Created by Nana Jimsheleishvili on 13.07.21.
//

import UIKit

class BrandsUMayLikeCell: UITableViewCell, TableCellConfigurable  {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Private Variables
    private var dataSource: HomeCollectionViewDataSource!
    private var viewModel: HomeCollectionViewModelProtocol!
    var coordinator: CoordinatorProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()

        setupLayout()
        setUpCollectionView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configure(with coordinator: CoordinatorProtocol) {
        self.coordinator = coordinator
        configureDataSource()
    }
    
    // MARK: - Setup
    private func setupLayout() {
        collectionView.registerNib(class: BrandsUMayLikeItemCell.self)
    }
    
    private func configureDataSource() {
        viewModel = HomeCollectionViewModel(coordinator: coordinator!)
        dataSource = HomeCollectionViewDataSource(with: collectionView, viewModel: viewModel)
        dataSource.refreshBrandsProducts()
    }
    
    private func setUpCollectionView() {
        let layout = UICollectionViewFlowLayout()
        //layout.estimatedItemSize = CGSize(width: 1, height: 1)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 20 , bottom: 0, right: 20)
        collectionView.collectionViewLayout = layout
    }
}
