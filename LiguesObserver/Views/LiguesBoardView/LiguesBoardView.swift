//
//  LiguesBoardView.swift
//  LiguesObserver
//
//  Created by Оливер Салихов on 19.09.2022.
//

import Foundation
import UIKit

class LiguesBoardView: UIView {
    
    private(set) lazy var wallpapperForCollection: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "wallpapperLigues1")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
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
    
    private(set) lazy var liguesCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CellForLiguesBoard.self, forCellWithReuseIdentifier: "cell")
        collectionView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isScrollEnabled = true
        return collectionView
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
        addSubview(wallpapperForCollection)
        addSubview(loadIndicator)
        addSubview(liguesCollection)
        
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            wallpapperForCollection.topAnchor.constraint(equalTo: self.topAnchor),
            wallpapperForCollection.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            wallpapperForCollection.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            wallpapperForCollection.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            loadIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            loadIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            loadIndicator.widthAnchor.constraint(equalToConstant: 60),
            loadIndicator.heightAnchor.constraint(equalToConstant: 60),
            
            liguesCollection.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            liguesCollection.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            liguesCollection.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            liguesCollection.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
}
