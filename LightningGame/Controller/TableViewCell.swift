//
//  TableViewCell.swift
//  LightningGame
//
//  Created by Daisuke Orita on 2020/03/04.
//  Copyright © 2020 Daisuke Orita. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var playerNameAndScoreLabel: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
