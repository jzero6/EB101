//
//  NewTrendsCell.swift
//  EbuyApp
//
//  Created by Nana Jimsheleishvili on 13.07.21.
//

import UIKit

class NewTrendsCell: UITableViewCell {

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bgView.setupShadow(UIView: bgView, ViewCornerRadius: 10, shadowOffSet: CGSize(width: 0, height: 2), opacity: 0.1, shadowRadius: 4)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(image: UIImage, title: String){
        productImageView.image = image
        titleLabel.text = title
    }
    
}
