//
//  ControlsCellViewModel.swift
//  CoronaStats
//
//  Created by n3deep on 13.02.2021.
//

import Foundation

class ControlsCellViewModel: ObservableObject {
    
    var currentControlDateState: ControlsDateEnum? {
        didSet {
            parentViewModel?.controlDate = currentControlDateState
        }
    }
    
    var currentControlTypeState: ControlsTypeEnum? {
        didSet {
            parentViewModel?.controlType = currentControlTypeState
        }
    }
    
    var currentControlAscendingState: ControlsAscendingEnum? {
        didSet {
            parentViewModel?.controlAscending = currentControlAscendingState
        }
    }
    
    var parentViewModel: WorldStatsViewModel?
    
    init(parentViewModel: WorldStatsViewModel) {
        self.parentViewModel = parentViewModel
        
        //self.currentControlDateState = .today
        //self.currentControlTypeState = .confirmed
        //self.currentControlAscendingState = .descending
    }
}
