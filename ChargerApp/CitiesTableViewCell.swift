//
//  CitiesTableViewCell.swift
//  ChargerApp
//
//  Created by Aleyna Mandacı on 15.07.2022.
//

import UIKit

class CitiesTableViewCell: UITableViewCell {

    @IBOutlet weak var cityName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
