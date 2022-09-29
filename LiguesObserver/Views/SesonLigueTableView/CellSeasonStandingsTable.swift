//
//  CellSeasonStandingsTable.swift
//  LiguesObserver
//
//  Created by Оливер Салихов on 22.09.2022.
//

import Foundation
import UIKit

class CellSeasonStandingsTable: UICollectionViewCell {
    
    private(set) lazy var teamLogo: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private(set) lazy var teamPosition: UILabel = {
       let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 70)
        label.textAlignment = .center
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) lazy var teamName: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) lazy var teamStats: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "", size: 18)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) lazy var gamesPlayed: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) lazy var goalsFor: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) lazy var goalsAgainst: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) lazy var points: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private(set) lazy var differenceGoal: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
        setConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setViews() {
        addSubview(teamLogo)
        addSubview(teamPosition)
        addSubview(teamName)
        addSubview(teamStats)
        addSubview(gamesPlayed)
        addSubview(goalsFor)
        addSubview(goalsAgainst)
        addSubview(points)
        addSubview(differenceGoal)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            teamLogo.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            teamLogo.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            teamLogo.widthAnchor.constraint(equalToConstant: 70),
            teamLogo.heightAnchor.constraint(equalToConstant: 70),
            
            teamPosition.topAnchor.constraint(equalTo: teamLogo.bottomAnchor, constant: 10),
            teamPosition.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            teamPosition.widthAnchor.constraint(equalToConstant: 90),
            teamPosition.heightAnchor.constraint(equalToConstant: 72),
            
            teamName.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            teamName.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            teamName.heightAnchor.constraint(equalToConstant: 22),
            
            teamStats.topAnchor.constraint(equalTo: teamName.bottomAnchor),
            teamStats.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            teamStats.heightAnchor.constraint(equalToConstant: 20),
            
            gamesPlayed.topAnchor.constraint(equalTo: teamStats.bottomAnchor),
            gamesPlayed.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            gamesPlayed.heightAnchor.constraint(equalToConstant: 20),
            
            goalsFor.topAnchor.constraint(equalTo: gamesPlayed.bottomAnchor),
            goalsFor.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            goalsFor.heightAnchor.constraint(equalToConstant: 20),
            
            goalsAgainst.topAnchor.constraint(equalTo: gamesPlayed.bottomAnchor),
            goalsAgainst.trailingAnchor.constraint(equalTo: goalsFor.leadingAnchor, constant: -10),
            goalsAgainst.heightAnchor.constraint(equalToConstant: 20),
            
            points.topAnchor.constraint(equalTo: goalsFor.bottomAnchor),
            points.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            points.heightAnchor.constraint(equalToConstant: 20),
            
            differenceGoal.topAnchor.constraint(equalTo: points.bottomAnchor),
            differenceGoal.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            differenceGoal.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}
