//
//  CellForLiguesBoard.swift
//  LiguesObserver
//
//  Created by Оливер Салихов on 19.09.2022.
//

import Foundation
import UIKit

class CellForLiguesBoard: UICollectionViewCell {
    
    private(set) lazy var ligueLogo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "defaultLogo")
        imageView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.4)
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private(set) lazy var abbLigue: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Times New Roman", size: 20)
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) lazy var nameLigue: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Times New Roman", size: 20)
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
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
        addSubview(ligueLogo)
        addSubview(abbLigue)
        addSubview(nameLigue)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            ligueLogo.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            ligueLogo.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            ligueLogo.widthAnchor.constraint(equalToConstant: 70),
            ligueLogo.heightAnchor.constraint(equalToConstant: 70),
            
            abbLigue.topAnchor.constraint(equalTo: ligueLogo.bottomAnchor, constant: 15),
            abbLigue.centerXAnchor.constraint(equalTo: self.centerXAnchor),
//            abbLigue.widthAnchor.constraint(equalToConstant: 100),
            abbLigue.heightAnchor.constraint(equalToConstant: 22),
            
            nameLigue.topAnchor.constraint(equalTo: abbLigue.bottomAnchor, constant: 15),
            nameLigue.centerXAnchor.constraint(equalTo: self.centerXAnchor),
//            nameLigue.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            nameLigue.heightAnchor.constraint(equalToConstant: 22)
        ])
    }
}
