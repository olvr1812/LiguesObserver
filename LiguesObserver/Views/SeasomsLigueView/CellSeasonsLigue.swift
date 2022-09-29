//
//  CellSeasonsLigue.swift
//  LiguesObserver
//
//  Created by Оливер Салихов on 20.09.2022.
//

import Foundation
import UIKit

class CellSeasonsLigue: UITableViewCell {
    
    private var cubokForBeuty: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "cubok")
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var ballForBeuty: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "ball")
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var infoView: UIView = {
       let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 30
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.black.cgColor
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var yearSeason: UILabel = {
        let label = UILabel()
        label.clipsToBounds = true
        label.textAlignment = .center
        label.font = UIFont(name: "Times New Roman", size: 20)
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) lazy var startEndSeason: UILabel = {
        let label = UILabel()
        label.clipsToBounds = true
        label.layer.cornerRadius = 10
        label.textAlignment = .center
        label.font = UIFont(name: "Times New Roman", size: 20)
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) lazy var numOfStagesInSeason: UILabel = {
        let label = UILabel()
        label.clipsToBounds = true
        label.textAlignment = .center
        label.font = UIFont(name: "Times New Roman", size: 20)
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setViews()
        setConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setViews() {
        addSubview(infoView)
        addSubview(cubokForBeuty)
        infoView.addSubview(yearSeason)
        infoView.addSubview(startEndSeason)
        infoView.addSubview(numOfStagesInSeason)
        addSubview(ballForBeuty)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            cubokForBeuty.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            cubokForBeuty.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            cubokForBeuty.heightAnchor.constraint(equalToConstant: 80),
            cubokForBeuty.widthAnchor.constraint(equalToConstant: 80),
            
            infoView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            infoView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            infoView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            infoView.widthAnchor.constraint(equalToConstant: 200),
            
            yearSeason.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            yearSeason.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            yearSeason.heightAnchor.constraint(equalToConstant: 20),
            
            startEndSeason.topAnchor.constraint(equalTo: self.yearSeason.bottomAnchor, constant: 10),
            startEndSeason.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            startEndSeason.heightAnchor.constraint(equalToConstant: 20),
            
            numOfStagesInSeason.topAnchor.constraint(equalTo: self.startEndSeason.bottomAnchor, constant: 10),
            numOfStagesInSeason.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            numOfStagesInSeason.heightAnchor.constraint(equalToConstant: 20),
            
            ballForBeuty.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            ballForBeuty.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            ballForBeuty.heightAnchor.constraint(equalToConstant: 80),
            ballForBeuty.widthAnchor.constraint(equalToConstant: 80)
        ])
    }
}
