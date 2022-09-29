//
//  ViewController.swift
//  LiguesObserver
//
//  Created by Оливер Салихов on 19.09.2022.
//

import UIKit

class LiguesBoardController: UIViewController {
    
    private let numOfItemsHorizontal: Double = 1
    private let numOfItemsVertical: Double = 4
    private let spacingBetweenItems: Double = 20
    private let sideSpacing: Double = 20
    
    private let liguesRequest: String? = "https://api-football-standings.azharimm.dev/leagues"
    private var liguesData: [LigueModel] = []
    private var data: DataModel?
    
    var liguesBoardView: LiguesBoardView? {
        guard let view = self.view as? LiguesBoardView else { return nil }
        return view
    }
    
    override func loadView() {
        super.loadView()
        self.view = LiguesBoardView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setTitel()
        tableViewSet()
        loadData()
    }
    
    private func setTitel() {
        self.navigationController?.navigationBar.topItem?.title = "Football Ligues"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 25)]
    }
    
    private func tableViewSet() {
        liguesBoardView?.liguesCollection.delegate = self
        liguesBoardView?.liguesCollection.dataSource = self
        liguesBoardView?.liguesCollection.reloadData()
    }
    
    private func loadData() {
        NetworkManager.shared.getData(url: liguesRequest, model: DataModel.self) { (ligues: DataModel) in
            DispatchQueue.main.async {
                self.data = ligues
                if let data = self.data?.data {
                    for ligue in data {
                        self.liguesData.append(ligue)
                        self.liguesBoardView?.liguesCollection.reloadData()
                        self.liguesBoardView?.loadIndicator.stopAnimating()
                    }
                }
            }
        }
    }
}

extension LiguesBoardController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        liguesData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CellForLiguesBoard else { return UICollectionViewCell() }
        cell.abbLigue.text = liguesData[indexPath.item].abbr
        cell.nameLigue.text = liguesData[indexPath.item].name
        cell.ligueLogo.image = UIImage(named: "defaultLogo")
        cell.ligueLogo.dowloaded(from: liguesData[indexPath.item].logos.light)
        cell.clipsToBounds = true
        cell.layer.cornerRadius = 5
        cell.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4)
        return cell
    }
}

extension LiguesBoardController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numVertivcalSpacing = numOfItemsVertical - 1
        let spacing: Double = spacingBetweenItems
        let numOfsideSpacings: Double = 2
        let itemWidth = (Double(collectionView.frame.width - (numOfsideSpacings * sideSpacing)))
        let itemHeight = (Double(collectionView.frame.height) - spacing * numVertivcalSpacing) / numOfItemsVertical
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let rootVC = SeasonsLigueController()
        rootVC.setLigueData(ligueData: liguesData[indexPath.item])
        navigationController?.pushViewController(rootVC, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        spacingBetweenItems
    }
}
