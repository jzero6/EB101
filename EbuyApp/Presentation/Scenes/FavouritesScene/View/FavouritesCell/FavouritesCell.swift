//
//  FavouritesCell.swift
//  EbuyApp
//
//  Created by Nana Jimsheleishvili on 14.07.21.
//

import UIKit

class FavouritesCell: UITableViewCell {

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var productSizeLabel: UILabel!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var colorDot: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bgView.setupShadow(UIView: bgView, ViewCornerRadius: 10, shadowOffSet: CGSize(width: 0, height: 2), opacity: 0.1, shadowRadius: 4)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    @IBAction func busketButton(_ sender: Any) {
    }
    
    func configure(with item: FavouritesModel){
        productName.text = item.name
        priceLabel.text = item.price
        productSizeLabel.text = "Size: \(item.size ?? "")"
        productImage.kf.setImage( with: URL(string: item.image ?? ""))
    }
    
}
