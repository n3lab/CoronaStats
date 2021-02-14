//
//  CountryCellViewModel.swift
//  CoronaStats
//
//  Created by n3deep on 13.02.2021.
//

import Foundation

class CountryCellViewModel {
    
    var countryData: Country
    var dateType: ControlsDateEnum
    var number: Int

    var name: String {
        return  String(number) + ". " + countryData.name
    }
    
    var confirmed: String {
        switch dateType {
        case .today:
            return String(countryData.newConfirmed)
        case .allTime:
            return String(countryData.totalConfirmed)
        }
    }
    
    var recovered: String {
        switch dateType {
        case .today:
            return String(countryData.newRecovered)
        case .allTime:
            return String(countryData.totalRecovered)
        }
    }
    
    var death: String {
        switch dateType {
        case .today:
            return String(countryData.newDeaths)
        case .allTime:
            return String(countryData.totalDeaths)
        }
    }
    
    init(countryData: Country, dateType: ControlsDateEnum, number: Int) {
        self.countryData = countryData
        self.dateType = dateType
        self.number = number + 1
    }
}
