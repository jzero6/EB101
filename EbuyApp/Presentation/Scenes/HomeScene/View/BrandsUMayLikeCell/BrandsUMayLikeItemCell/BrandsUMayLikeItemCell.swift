//
//  BrandsUMayLikeItemCell.swift
//  EbuyApp
//
//  Created by Nana Jimsheleishvili on 13.07.21.
//

import UIKit

class BrandsUMayLikeItemCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupLayout()
    }

    private func setupLayout() {
        titleLabel.backgroundColor = UIColor.lightGray
        titleLabel.frame.size.height = 36
    }

    func configure(with item: ProductModel){
        titleLabel.text = item.title
    }
}
