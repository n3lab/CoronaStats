//
//  WorldStatsViewModel.swift
//  CoronaStats
//
//  Created by n3deep on 13.02.2021.
//

import Foundation
import Combine

class WorldStatsViewModel: ObservableObject {

    @Published var coronaStats: CoronaStatsModel?
    
    private let coronaService: CoronaServiceType?
    
    @Published var controlDate: ControlsDateEnum?
    @Published var controlType: ControlsTypeEnum?
    @Published var controlAscending: ControlsAscendingEnum?
    
    private var subscriptions = Set<AnyCancellable>()
    
    init() {
        self.coronaService = Covid19apiService()
        
        //binding
        $controlDate
            .sink { controlDate in
                self.coronaStats?.sortCountriesBy(date: controlDate ?? .today, type: self.controlType ?? .confirmed, ascending: self.controlAscending ?? .descending)
            }
            .store(in: &subscriptions)
        
        $controlType
            .sink { controlType in
                self.coronaStats?.sortCountriesBy(date: self.controlDate ?? .today, type: controlType ?? .confirmed, ascending: self.controlAscending ?? .descending)
                }
            .store(in: &subscriptions)
        
        $controlAscending
            .sink { controlAscending in
                self.coronaStats?.sortCountriesBy(date: self.controlDate ?? .today, type: self.controlType ?? .confirmed, ascending: controlAscending ?? .descending)
            }
            .store(in: &subscriptions)
        
        
        self.controlDate = .today
        self.controlType = .confirmed
        self.controlAscending = .descending
    }
    
    func fetchCoronaStats() {

        coronaService?.fetchCoronaStats(onSuccess: { statsData in
            //print(statsData)
            
            var sortedCoronaStats = statsData
            sortedCoronaStats.sortCountriesBy(date: .today, type: .confirmed, ascending: .descending)
            
            self.coronaStats = sortedCoronaStats
            
        }, onFailure: {error in
            print(error)
        })
    }
    
    func controlsCellViewModel() -> ControlsCellViewModel? {
        return ControlsCellViewModel(parentViewModel: self)
    }
    
    func worldCellViewModel() -> WorldCellViewModel? {
        guard let worldData = coronaStats?.world else {
            return nil
        }
        return WorldCellViewModel(worldData: worldData, dateType: controlDate ?? .today)
    }
    
    func countryCellViewModel(forIndexPath indexPath: IndexPath) -> CountryCellViewModel? {
        guard let countryData = coronaStats?.countries[indexPath.row] else {
            return nil
        }
        return CountryCellViewModel(countryData: countryData, dateType: controlDate ?? .today, number: indexPath.row)
    }
}
