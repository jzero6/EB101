//
//  SomeProductsCell.swift
//  EbuyApp
//
//  Created by Nana Jimsheleishvili on 13.07.21.
//

import UIKit

class SomeProductsCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Private Variables
    private var dataSource: SomeProductsDataSource!
    private var viewModel: SomeProductsViewModelProtocol!
    var coordinator: CoordinatorProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupLayout()
        setUpCollectionView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(coordinator: CoordinatorProtocol) {
        self.coordinator = coordinator
        configureDataSource()
    }
    
    // MARK: - Setup
    private func setupLayout() {
        collectionView.registerNib(class: SomeProductsItemCell.self)
    }
    
    private func configureDataSource() {
        viewModel = SomeProductsViewModel(coordinator: coordinator!)
        dataSource = SomeProductsDataSource(with: collectionView, viewModel: viewModel)
        dataSource.refresh()
    }
    
    private func setUpCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 170, height: 208)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 20 , bottom: 0, right: 20)
        layout.minimumLineSpacing = 20
        collectionView.collectionViewLayout = layout
        collectionView.isPagingEnabled = true
    }
}

extension SomeProductsCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 170, height: 208)
    }
}
