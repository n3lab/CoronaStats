//
//  ControlsCell.swift
//  CoronaStats
//
//  Created by n3deep on 13.02.2021.
//

import UIKit
import Combine

enum ControlsDateEnum: CaseIterable {
    case today
    case allTime
}

enum ControlsTypeEnum: CaseIterable {
    case confirmed
    case recovered
    case death
}

enum ControlsAscendingEnum: CaseIterable {
    case descending
    case ascending
}

class ControlsCell: UITableViewCell {
    
    @IBOutlet weak var dateSegControl: UISegmentedControl!
    @IBOutlet weak var typeSegControl: UISegmentedControl!
    @IBOutlet weak var ascendingSegControl: UISegmentedControl!
    
    @IBAction func controlDateChanged(_ sender: Any) {
        viewModel?.currentControlDateState = ControlsDateEnum.allCases[dateSegControl.selectedSegmentIndex]
    }
    
    @IBAction func controlTypeChanged(_ sender: Any) {
        viewModel?.currentControlTypeState = ControlsTypeEnum.allCases[typeSegControl.selectedSegmentIndex]
    }
    
    @IBAction func controlAscendingChanged(_ sender: Any) {
        viewModel?.currentControlAscendingState = ControlsAscendingEnum.allCases[ascendingSegControl.selectedSegmentIndex]
    }
    
    var viewModel: ControlsCellViewModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()

        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
}
