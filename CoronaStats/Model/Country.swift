//
//  Country.swift
//  CoronaStats
//
//  Created by n3deep on 13.02.2021.
//

import Foundation

struct Country: Codable {

    let name: String
    let newConfirmed: Int
    let totalConfirmed: Int
    let newDeaths: Int
    let totalDeaths: Int
    let newRecovered: Int
    let totalRecovered: Int
    let date: String
    
    enum CodingKeys: String, CodingKey {
        
        case name = "Country"
        case newConfirmed = "NewConfirmed"
        case totalConfirmed = "TotalConfirmed"
        case newDeaths = "NewDeaths"
        case totalDeaths = "TotalDeaths"
        case newRecovered = "NewRecovered"
        case totalRecovered = "TotalRecovered"
        case date = "Date"
    }
}
