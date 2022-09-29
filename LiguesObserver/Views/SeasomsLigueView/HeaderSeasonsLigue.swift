//
//  HeaderSeasonsLigue.swift
//  LiguesObserver
//
//  Created by Оливер Салихов on 20.09.2022.
//

import Foundation
import UIKit

class HeaderSeasonsLigue: UITableViewHeaderFooterView {
    
    private(set) lazy var mainImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "headerBack")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private(set) lazy var logoLigue: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "defaultLogo")
        imageView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.4)
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private(set) lazy var abbLigue: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 23)
        label.numberOfLines = 0
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) lazy var nameLigue: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 23)
        label.numberOfLines = 0
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setViews()
        setConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setViews() {
        addSubview(mainImageView)
        addSubview(logoLigue)
        addSubview(abbLigue)
        addSubview(nameLigue)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            mainImageView.topAnchor.constraint(equalTo: self.topAnchor),
            mainImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            mainImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            mainImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            logoLigue.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            logoLigue.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            logoLigue.heightAnchor.constraint(equalToConstant: 100),
            logoLigue.widthAnchor.constraint(equalToConstant: 100),
            
            abbLigue.topAnchor.constraint(equalTo: nameLigue.bottomAnchor, constant: 10),
            abbLigue.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            abbLigue.heightAnchor.constraint(equalToConstant: 30),
            
            nameLigue.topAnchor.constraint(equalTo: logoLigue.bottomAnchor, constant: 10),
            nameLigue.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            nameLigue.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}
