//
//  CityTableViewCell.swift
//  MambaTest
//
//  Created by Andrey Ildyakov on 16.07.17.
//  Copyright © 2017 Andrey Ildyakov. All rights reserved.
//

import UIKit

class CityTableViewCell: UITableViewCell {
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var cityCountLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    weak var viewModel: CityCellViewModel! {
        didSet {
            self.cityNameLabel.text = viewModel.cityName
            self.cityCountLabel.text = viewModel.cityCountString
        }
    }
    
}
