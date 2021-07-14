//
//  SomeProductsItemCell.swift
//  EbuyApp
//
//  Created by Nana Jimsheleishvili on 13.07.21.
//

import UIKit
import Kingfisher

class SomeProductsItemCell: UICollectionViewCell {

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupLayout()
    }
    
    private func setupLayout() {
        bgView.setupShadow(UIView: bgView, ViewCornerRadius: 10, shadowOffSet: CGSize(width: 0, height: 2), opacity: 0.1, shadowRadius: 4)
    }

    func configure(with item: ProductModel){
        titleLabel.text = item.title
        descriptionLabel.text = item.description
        imageView.kf.setImage( with: URL(string: item.image ?? ""))
    }

}
