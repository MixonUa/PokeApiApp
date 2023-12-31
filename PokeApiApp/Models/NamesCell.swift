//
//  NamesCell.swift
//  PokeApiApp
//
//  Created by Михаил Фролов on 12.09.2023.
//

import UIKit

class NamesCell: UITableViewCell {
    @IBOutlet weak var namesLabel: UILabel!
    @IBOutlet weak var urlLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func updateCell(name: String, url: String) {
        namesLabel.text = name
        urlLabel.text = url
    }
}
