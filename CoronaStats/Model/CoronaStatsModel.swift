//
//  CoronaStatsModel.swift
//  CoronaStats
//
//  Created by n3deep on 13.02.2021.
//

import Foundation

struct CoronaStatsModel: Codable {
    
    mutating func sortCountriesBy(date: ControlsDateEnum, type: ControlsTypeEnum, ascending: ControlsAscendingEnum) {
        switch type {
        case .confirmed:
            switch date {
            case .today:
                switch ascending {
                case .ascending:
                    countries = countries.sorted{$0.newConfirmed < $1.newConfirmed }
                case .descending:
                    countries = countries.sorted{$0.newConfirmed > $1.newConfirmed }
                }
            case .allTime:
                switch ascending {
                case .ascending:
                    countries = countries.sorted{$0.totalConfirmed < $1.totalConfirmed }
                case .descending:
                    countries = countries.sorted{$0.totalConfirmed > $1.totalConfirmed }
                }
            }
        case .recovered:
            switch date {
            case .today:
                switch ascending {
                case .ascending:
                    countries = countries.sorted{$0.newRecovered < $1.newRecovered }
                case .descending:
                    countries = countries.sorted{$0.newRecovered > $1.newRecovered }
                }
            case .allTime:
                switch ascending {
                case .ascending:
                    countries = countries.sorted{$0.totalRecovered < $1.totalRecovered }
                case .descending:
                    countries = countries.sorted{$0.totalRecovered > $1.totalRecovered }
                }
            }
        case .death:
            switch date {
            case .today:
                switch ascending {
                case .ascending:
                    countries = countries.sorted{$0.newDeaths < $1.newDeaths }
                case .descending:
                    countries = countries.sorted{$0.newDeaths > $1.newDeaths }
                }
            case .allTime:
                switch ascending {
                case .ascending:
                    countries = countries.sorted{$0.totalDeaths < $1.totalDeaths }
                case .descending:
                    countries = countries.sorted{$0.totalDeaths > $1.totalDeaths }
                }
            }
        }
        
        
    }
    
    let world: World
    var countries: [Country]
    
    enum CodingKeys: String, CodingKey {

        case world = "Global"
        case countries = "Countries"
    }
}
