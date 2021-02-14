//
//  CoronaService.swift
//  CoronaStats
//
//  Created by n3deep on 13.02.2021.
//

import Foundation

protocol CoronaServiceType {
    
    func fetchCoronaStats(onSuccess: @escaping (CoronaStatsModel) -> Void, onFailure: @escaping (String) -> Void)
}
