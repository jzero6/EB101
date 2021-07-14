//
//  StylesBasedItemCell.swift
//  EbuyApp
//
//  Created by Nana Jimsheleishvili on 13.07.21.
//

import UIKit

class StylesBasedItemCell: UICollectionViewCell {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupLayout()
    }
    
    @IBAction func heartButton(_ sender: Any) {
    }
    @IBAction func dislikeButton(_ sender: Any) {
    }
    

    private func setupLayout() {
        bgView.setupShadow(UIView: bgView, ViewCornerRadius: 10, shadowOffSet: CGSize(width: 0, height: 2), opacity: 0.1, shadowRadius: 4)
    }

    func configure(with item: StylesBasedModel){
        titleLabel.text = item.name
        priceLabel.text = item.price
        productImageView.kf.setImage( with: URL(string: item.image ?? ""))
    }
}
