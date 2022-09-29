//
//  SeasonLigueTableController.swift
//  LiguesObserver
//
//  Created by Оливер Салихов on 21.09.2022.
//

import Foundation
import UIKit

class SeasonStandingsTableController: UIViewController {
    
    private let numOfItemsHorizontal: Double = 1
    private let numOfItemsVertical: Double = 4
    private let spacingBetweenItems: Double = 30
    private let sideSpacing: Double = 20
    
    private var allSeasons: [Int] = []
    private var requestSeasonData: String?
    private var seasonData: SeasonData?
    private var standings: [StandingData] = []
    private var standingsData: [Standing] = []
    private var titleName: Int = 0
    
    var seasonStandingsTableView: SeasonStandingsTableView? {
        guard let view = self.view as? SeasonStandingsTableView else { return nil }
        return view
    }
    
    override func loadView() {
        super.loadView()
        self.view = SeasonStandingsTableView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTitel()
        let barItemShowSeasons = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(showSeasons))
        navigationItem.rightBarButtonItem = barItemShowSeasons
        clearData()
        dowloadData()
        setCollectionStandings()
        setData()
    }
    
    @objc private func showSeasons(sender: UIBarButtonItem) {
        guard let hidden = seasonStandingsTableView?.seasonsPeaker.isHidden else { return }
         
        seasonStandingsTableView?.seasonsPeaker.isHidden = !hidden
        if !hidden {
            clearData()
            dowloadData()
            setCollectionStandings()
            setTitel()
            setData()
        }
    }
    
    private func setTitel() {
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 25)]
        self.title = "\(titleName)"
    }
    
    private func clearData() {
        LiguesLocaleStore.shared.logoCahce.removeAllObjects()
        LiguesLocaleStore.shared.standings.removeAll()
        allSeasons = []
        standings = []
        standingsData = []
    }
    
    private func dowloadData() {
        NetworkManager.shared.getData(url: requestSeasonData, model: SeasonRequestData.self) { (seasonData: SeasonRequestData) in
            DispatchQueue.main.async {
                LiguesLocaleStore.shared.seasonData = seasonData.data
                LiguesLocaleStore.shared.standings = seasonData.data.standings
                self.seasonStandingsTableView?.loadIndicator.stopAnimating()
                self.setData()
            }
        }
    }
    
    private func setData() {
        seasonData = LiguesLocaleStore.shared.seasonData
        for season in LiguesLocaleStore.shared.seasonsData {
            allSeasons.append(season.year)
        }
        for standing in LiguesLocaleStore.shared.standings {
            standings.append(standing)
            standingsData.append(Standing(teamName: standing.team.displayName, teamStats: standing.stats[12].displayValue, gamesPlayed: standing.stats[3].displayValue, goalsFor: standing.stats[4].displayValue, goalsAgai: standing.stats[5].displayValue, points: standing.stats[6].displayValue, pointDifferential: standing.stats[9].displayValue))
            seasonStandingsTableView?.standingsCollection.reloadData()
        }
    }
    
    private func setCollectionStandings() {
        seasonStandingsTableView?.standingsCollection.dataSource = self
        seasonStandingsTableView?.standingsCollection.delegate = self
        seasonStandingsTableView?.seasonsPeaker.dataSource = self
        seasonStandingsTableView?.seasonsPeaker.delegate = self
    }
    
    func setRequest(year: Int) {
        requestSeasonData = "https://api-football-standings.azharimm.dev/leagues/eng.1/standings?season=\(year)&sort=asc"
        titleName = year
    }
}

extension SeasonStandingsTableController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numVertivcalSpacing = numOfItemsVertical - 1
        let spacing: Double = spacingBetweenItems
        let numOfsideSpacings: Double = 2
        let itemWidth = (Double(collectionView.frame.width - (numOfsideSpacings * sideSpacing)))
        let itemHeight = (Double(collectionView.frame.height) - spacing * numVertivcalSpacing) / numOfItemsVertical
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        spacingBetweenItems
    }
}



extension SeasonStandingsTableController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        standings.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CellSeasonStandingsTable else { return UICollectionViewCell() }
        cell.teamLogo.image = UIImage(named: "defaultLogo")
        if let logo = standings[indexPath.item].team.logos[0].href {
            cell.teamLogo.dowloaded(from: logo)
        }
        cell.teamPosition.text = "\(indexPath.item + 1)"
        cell.teamName.text = standings[indexPath.item].team.displayName
        cell.teamStats.text = "W-T-L: \(standingsData[indexPath.item].teamStats)"
        cell.differenceGoal.text = "Goal Difference: \(standingsData[indexPath.item].pointDifferential)"
        cell.gamesPlayed.text = "Games: \(standingsData[indexPath.item].gamesPlayed)"
        cell.goalsFor.text = "Goals: \(standingsData[indexPath.item].goalsFor)"
        cell.goalsAgainst.text = "Missed: \(standingsData[indexPath.item].goalsAgai)"
        cell.points.text = "Points: \(standingsData[indexPath.item].points)"
        cell.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4)
        cell.clipsToBounds = true
        cell.layer.cornerRadius = 20
        cell.layer.borderWidth = 2
        cell.layer.borderWidth = 2
        return cell
    }
    
    
}

extension SeasonStandingsTableController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        allSeasons.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        "\(allSeasons[row])"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        setRequest(year: allSeasons[row])
    }
    
    
}
