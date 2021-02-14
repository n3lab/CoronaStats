//
//  Covid19apiService.swift
//  CoronaStats
//
//  Created by n3deep on 13.02.2021.
//

import Foundation

class Covid19apiService: CoronaServiceType {
    
    let apiURL: String = "https://api.covid19api.com"
    
    func fetchCoronaStats(onSuccess: @escaping (CoronaStatsModel) -> Void, onFailure: @escaping (String) -> Void) {

        if let url = URL(string: apiURL + "/summary") {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    let jsonDecoder = JSONDecoder()
                    do {
                        let parsedJSON = try jsonDecoder.decode(CoronaStatsModel.self, from: data)
                        onSuccess(parsedJSON)
                    } catch {
                        onFailure(error.localizedDescription)
                    }
                }
           }.resume()
        }
    }
}
