//
//  WorldStatsController.swift
//  CoronaStats
//
//  Created by n3deep on 13.02.2021.
//

import UIKit
import Combine

class WorldStatsController: UIViewController {

    enum StatsTableViewSections {
        case controls
        case world
        case countries
    }
    
    enum CellIdentifiers: String {
        case controls = "ControlsCell"
        case world = "WorldCell"
        case country = "CountryCell"
    }
    
    enum SectionTitles: String, CaseIterable {
        case controls = ""
        case world = "Во всём мире"
        case country = "По странам"
    }
    
    let statsTableViewStructure: [StatsTableViewSections] = [.controls, .world, .countries]
    
    @IBOutlet weak var statsTableView: UITableView!
   
    var viewModel: WorldStatsViewModel?
    
    private var subscriptions = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //navigationController?.navigationBar.prefersLargeTitles = true

        statsTableView.dataSource = self
        statsTableView.delegate = self
                
        let controlsNib = UINib(nibName: CellIdentifiers.controls.rawValue, bundle: nil)
        statsTableView.register(controlsNib, forCellReuseIdentifier: CellIdentifiers.controls.rawValue)
        let worldNib = UINib(nibName: CellIdentifiers.world.rawValue, bundle: nil)
        statsTableView.register(worldNib, forCellReuseIdentifier: CellIdentifiers.world.rawValue)
        let countryNib = UINib(nibName: CellIdentifiers.country.rawValue, bundle: nil)
        statsTableView.register(countryNib, forCellReuseIdentifier: CellIdentifiers.country.rawValue)
        
        viewModel = WorldStatsViewModel()
        viewModel?.fetchCoronaStats()
        
        //binding
        viewModel?.$coronaStats
            .receive(on: DispatchQueue.main)
            .sink { [weak self] coronaStats in
                self?.statsTableView.reloadSections(IndexSet(integersIn: 1...2), with: .fade)
             }
            .store(in: &subscriptions)
    }
}

extension WorldStatsController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return statsTableViewStructure.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let currentSection = statsTableViewStructure[section]
        switch currentSection {
        case .controls:
            return 1
        case .world:
            return 1
        case .countries:
            return viewModel?.coronaStats?.countries.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let currentSection = statsTableViewStructure[indexPath.section]
        
        switch currentSection {
        case .controls:
            let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.controls.rawValue, for: indexPath) as! ControlsCell
            let cellViewModel = viewModel?.controlsCellViewModel()
            cell.viewModel = cellViewModel
            return cell
        case .world:
            let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.world.rawValue, for: indexPath) as! WorldCell
            let cellViewModel = viewModel?.worldCellViewModel()
            cell.viewModel = cellViewModel
            return cell
        case .countries:
            let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.country.rawValue, for: indexPath) as! CountryCell
            let cellViewModel = viewModel?.countryCellViewModel(forIndexPath: indexPath)
            cell.viewModel = cellViewModel
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return SectionTitles.allCases[section].rawValue
    }
}

extension WorldStatsController: UITableViewDelegate {
    
}
