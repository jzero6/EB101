//
//  SavedItemsCell.swift
//  EbuyApp
//
//  Created by Nana Jimsheleishvili on 13.07.21.
//

import UIKit

class SavedItemsCell: UITableViewCell {
    
    @IBOutlet weak var savedItemLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Private Variables
    private var dataSource: ReuseCollectionViewDataSource!
    private var viewModel: ReuseCollectionViewModelProtocol!
    var coordinator: CoordinatorProtocol?
    var products = [ProductModel]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupLayout()
        setUpCollectionView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func viewAllButton(_ sender: Any) {
    }
    
    
    func configure(with products: [ProductModel], coordinator: CoordinatorProtocol) {
        self.products = products
        self.coordinator = coordinator
        configureDataSource()
    }
    
    // MARK: - Setup
    private func setupLayout() {
        collectionView.registerNib(class: SavedItemsItemCell.self)
    }
    
    private func configureDataSource() {
        viewModel = ReuseCollectionViewModel(coordinator: coordinator!)
        dataSource = ReuseCollectionViewDataSource(with: collectionView, products: products, viewModel: viewModel, cellToDeque: SavedItemsItemCell.self)
    }
    
    private func setUpCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: UIScreen.main.bounds.size.width - 40, height: 120)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 20 , bottom: 0, right: UIScreen.main.bounds.size.width - 20)
        layout.minimumLineSpacing = 20
        collectionView.collectionViewLayout = layout
        collectionView.isPagingEnabled = true
    }
}

extension SavedItemsCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.size.width - 40, height: 120)
    }
}
