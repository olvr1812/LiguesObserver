//
//  SeasonsLigueController.swift
//  LiguesObserver
//
//  Created by Оливер Салихов on 20.09.2022.
//

import Foundation
import UIKit

class SeasonsLigueController: UIViewController {
    
    private var requestSeasons: String?
    private var seasonsLigueData: SeasonsData?
    private var seasons: [Season] = []
    private var ligueData: LigueModel?
    
    private var headerHeight: CGFloat = 200
    private var cellHeight: CGFloat = 100
    
    var seasonsLigueView: SeasonsLigueView? {
        guard let view = self.view as? SeasonsLigueView else { return nil }
        return view
    }
    
    override func loadView() {
        super.loadView()
        self.view = SeasonsLigueView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTitel()
        dowloadData()
        tableSeasonsSet()
    }
    
    
    private func setTitel() {
        self.navigationController?.navigationBar.topItem?.title = "Football Ligues"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 25)]
    }
    
    private func tableSeasonsSet() {
        seasonsLigueView?.seasonsTable.delegate = self
        seasonsLigueView?.seasonsTable.dataSource = self
    }
    
    private func updateData() {
        seasonsLigueView?.seasonsTable.reloadData()
    }
    
    private func dowloadData() {
        NetworkManager.shared.getData(url: requestSeasons, model: SeasonsData.self) { (seasonsData: SeasonsData) in
            DispatchQueue.main.async {
                self.seasonsLigueData = seasonsData
                LiguesLocaleStore.shared.seasonsData = seasonsData.data.seasons
                self.seasons = seasonsData.data.seasons
                self.seasonsLigueView?.loadIndicator.stopAnimating()
                self.updateData()
            }
        }
    }
    
    private func dateFormat(date: String) -> String {
        let dataFormater = DateFormatter()
        dataFormater.locale = Locale(identifier: "ru_RU")
        dataFormater.dateFormat = "yyyy-MM-dd'T'HH:mmZ"
        let date = dataFormater.date(from: date)
        if let correctData: String = date?.formatted(date: .numeric, time: .omitted) {
            return correctData
        }
        return "Incorrect date"
    }
    
    func setLigueData(ligueData: LigueModel) {
        self.ligueData = ligueData
        requestSeasons = "https://api-football-standings.azharimm.dev/leagues/\(ligueData.id)/seasons"
    }
}

extension SeasonsLigueController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        seasons.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        cellHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? CellSeasonsLigue else { return UITableViewCell() }
        let start = dateFormat(date: seasons[indexPath.item].startDate)
        let end = dateFormat(date: seasons[indexPath.item].endDate)
        cell.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4)
        cell.yearSeason.text = String(seasons[indexPath.item].year)
        cell.startEndSeason.text = "\(start) - \(end)"
        cell.numOfStagesInSeason.text = "Количество этапов: \(seasons[indexPath.item].types.count)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        headerHeight
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as? HeaderSeasonsLigue else { return UITableViewHeaderFooterView() }
        guard let ligueData = self.ligueData else { return header}
        header.logoLigue.dowloaded(from: ligueData.logos.light)
        header.nameLigue.text = ligueData.name
        header.abbLigue.text = ligueData.abbr
        return header
    }
}

extension SeasonsLigueController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rootVC = SeasonStandingsTableController()
        rootVC.setRequest(year: seasons[indexPath.item].year)
        navigationController?.pushViewController(rootVC, animated: true)
    }
}
