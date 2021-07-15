//
//  HomeDataSource.swift
//  EbuyApp
//
//  Created by Nana Jimsheleishvili on 13.07.21.
//

import UIKit

final class HomeTableViewDataSource: BaseTableViewDataSource {
    
    
    init(with tableView: UITableView, coordinator: CoordinatorDelegate) {
        super.init()
        
        self.coordinator = coordinator
        self.tableView = tableView
        self.tableView?.delegate = self
        
        multiSectionModels = []
    }
    
    
    override func refresh() {
        multiSectionModels = [[], [], [], [], [], [], [], [], []]
        
        let data0 = CategoryCellData(title: "NewTrend", imageName: UIImage(named: "imageDressBlue")!)
        multiSectionModels[0].append(categoryCell(data: data0))
        
        multiSectionModels[1].append(someProductsCell)
        
        let data1 = CategoryCellData(title: "SRIPPES", imageName: UIImage(named: "imageBoyGray")!)
        multiSectionModels[2].append(categoryCell(data: data1))
        
        let data2 = CategoryCellData(title: "HOT TREND", imageName: UIImage(named: "imageGirlFlower")!)
        multiSectionModels[3].append(categoryCell(data: data2))
        
        let data3 = CategoryCellData(title: "SUMMER SEA", imageName: UIImage(named: "imageGirlFlower")!)
        multiSectionModels[4].append(categoryCell(data: data3))

        multiSectionModels[5].append(recentlyViewedCell)
        multiSectionModels[6].append(savedItemsCell)
        multiSectionModels[7].append(brandsUMayLikeCell)
        multiSectionModels[8].append(stylesBasedCell)
        
        tableView?.reloadData()
    }
}

// MARK: - TableView Cells
private extension HomeTableViewDataSource {

    private func categoryCell(data: CategoryCellData) -> CellViewModel {
        return CellViewModel(cellIdentifier: CategoryCell.identifier,
                             userData: [.data: data])
    }
    
    private var someProductsCell: CellViewModel {
        return CellViewModel(cellIdentifier: SomeProductsCell.identifier)
    }
    
    private var recentlyViewedCell: CellViewModel {
        return CellViewModel(cellIdentifier: RecentlyViewedCell.identifier)
    }
    
    private var savedItemsCell: CellViewModel {
        return CellViewModel(cellIdentifier: SavedItemsCell.identifier)
    }
    
    private var brandsUMayLikeCell: CellViewModel {
        return CellViewModel(cellIdentifier: BrandsUMayLikeCell.identifier)
    }
    
    private var stylesBasedCell: CellViewModel {
        return CellViewModel(cellIdentifier: StylesBasedCell.identifier)
    }
}

extension HomeTableViewDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}

