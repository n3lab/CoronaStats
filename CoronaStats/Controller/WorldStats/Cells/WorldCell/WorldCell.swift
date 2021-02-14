//
//  WorldCell.swift
//  CoronaStats
//
//  Created by n3deep on 13.02.2021.
//

import UIKit

class WorldCell: UITableViewCell {

    @IBOutlet weak var confirmedLabel: UILabel!
    @IBOutlet weak var recoveredLabel: UILabel!
    @IBOutlet weak var deathLabel: UILabel!
    
    var viewModel: WorldCellViewModel? {
        willSet(viewModel) {
            confirmedLabel.text = viewModel?.confirmed
            recoveredLabel.text = viewModel?.recovered
            deathLabel.text = viewModel?.death
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
