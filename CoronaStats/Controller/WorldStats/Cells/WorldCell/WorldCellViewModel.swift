//
//  WorldCellViewModel.swift
//  CoronaStats
//
//  Created by n3deep on 13.02.2021.
//

import Foundation

class WorldCellViewModel {
    
    var worldData: World
    var dateType: ControlsDateEnum

    var confirmed: String {
        switch dateType {
        case .today:
            return String(worldData.newConfirmed)
        case .allTime:
            return String(worldData.totalConfirmed)
        }
    }
    
    var recovered: String {
        switch dateType {
        case .today:
            return String(worldData.newRecovered)
        case .allTime:
            return String(worldData.totalRecovered)
        }
    }
    
    var death: String {
        switch dateType {
        case .today:
            return String(worldData.newDeaths)
        case .allTime:
            return String(worldData.totalDeaths)
        }
    }
    
    init(worldData: World, dateType: ControlsDateEnum) {
        self.worldData = worldData
        self.dateType = dateType
    }
}
