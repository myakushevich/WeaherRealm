//
//  WeatherRealmTableViewCell.swift
//  module14task
//
//  Created by Mikhail Yakushevich on 26.01.2021.
//

import UIKit

class WeatherRealmTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var timeLabel: UILabel!
    
    
    @IBOutlet weak var tempLabel: UILabel!
    
    
    @IBOutlet weak var windLabel: UILabel!
    
    @IBOutlet weak var cloudLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
