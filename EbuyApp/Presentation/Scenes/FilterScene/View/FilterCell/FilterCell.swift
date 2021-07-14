//
//  FilterCell.swift
//  EbuyApp
//
//  Created by Nana Jimsheleishvili on 13.07.21.
//

import UIKit

class FilterCell: UITableViewCell {

    @IBOutlet weak var allBut: UIButton!
    @IBOutlet weak var filterlistLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    @IBAction func allButton(_ sender: Any) {
    }
    
    func configure(with item: String, allButton: String){
        filterlistLabel.text = item
        allBut.setTitle(allButton, for: .normal)
    }
    
}
