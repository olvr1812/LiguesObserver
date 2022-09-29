//
//  SeasonLigueTableView.swift
//  LiguesObserver
//
//  Created by Оливер Салихов on 21.09.2022.
//

import Foundation
import UIKit

class SeasonStandingsTableView: UIView {
    
    private lazy var mainBackgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "wallpapperLigues1")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private(set) lazy var standingsCollection: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CellSeasonStandingsTable.self, forCellWithReuseIdentifier: "cell")
        collectionView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private(set) lazy var loadIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.startAnimating()
        indicator.color = .gray
        indicator.backgroundColor = .black
        indicator.clipsToBounds = true
        indicator.layer.borderWidth = 4
        indicator.layer.cornerRadius = 30
        indicator.layer.borderColor = UIColor.black.cgColor
        indicator.hidesWhenStopped = true
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
    
    private(set) lazy var seasonsPeaker: UIPickerView = {
       let picker = UIPickerView()
        picker.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.8)
        picker.tintColor = .black
        picker.clipsToBounds = true
        picker.layer.borderWidth = 2
        picker.layer.cornerRadius = 10
        picker.layer.borderColor = UIColor.black.cgColor
        picker.isHidden = true
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
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
        addSubview(mainBackgroundImage)
        addSubview(loadIndicator)
        addSubview(standingsCollection)
        addSubview(seasonsPeaker)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            mainBackgroundImage.topAnchor.constraint(equalTo: self.topAnchor),
            mainBackgroundImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            mainBackgroundImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            mainBackgroundImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            loadIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            loadIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            loadIndicator.widthAnchor.constraint(equalToConstant: 60),
            loadIndicator.heightAnchor.constraint(equalToConstant: 60),
            
            standingsCollection.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            standingsCollection.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            standingsCollection.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            standingsCollection.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            seasonsPeaker.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            seasonsPeaker.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}
