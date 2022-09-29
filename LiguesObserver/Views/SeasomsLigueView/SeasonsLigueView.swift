//
//  SeasonsLigueView.swift
//  LiguesObserver
//
//  Created by Оливер Салихов on 20.09.2022.
//

import Foundation
import UIKit

class SeasonsLigueView: UIView {
    
    private(set) lazy var mainBackgroundImage: UIImageView = {
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
    
    private(set) lazy var seasonsTable: UITableView = {
        let tableView = UITableView()
        tableView.register(CellSeasonsLigue.self, forCellReuseIdentifier: "cell")
        tableView.register(HeaderSeasonsLigue.self, forHeaderFooterViewReuseIdentifier: "header")
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = .red
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
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
        addSubview(seasonsTable)
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
            
            seasonsTable.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            seasonsTable.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            seasonsTable.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            seasonsTable.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
}
