//
//  SavedItemsCell.swift
//  EbuyApp
//
//  Created by Nana Jimsheleishvili on 13.07.21.
//

import UIKit

class SavedItemsCell: UITableViewCell, TableCellConfigurable  {
    
    @IBOutlet weak var savedItemLabel: UILabel!
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
    
    @IBAction func viewAllButton(_ sender: Any) {
        coordinator?.proceedToFavouritesVC()
    }
    
    
    func configure(with coordinator: CoordinatorProtocol) {
        self.coordinator = coordinator
        configureDataSource()
    }
    
    // MARK: - Setup
    private func setupLayout() {
        collectionView.registerNib(class: SavedItemsItemCell.self)
    }
    
    private func configureDataSource() {
        viewModel = HomeCollectionViewModel(coordinator: coordinator!)
        dataSource = HomeCollectionViewDataSource(with: collectionView, viewModel: viewModel)
        dataSource.refreshSavedProducts()
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
