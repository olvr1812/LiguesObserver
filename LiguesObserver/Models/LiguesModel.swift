//
//  LiguesModel.swift
//  LiguesObserver
//
//  Created by Оливер Салихов on 19.09.2022.
//

import Foundation

struct DataModel: Decodable {
    var data: [LigueModel]
}

struct LigueModel: Decodable {
    let id: String
    let name: String
    let slug: String
    let abbr: String
    let logos: urlLogos
}

struct urlLogos: Decodable {
    let light: String
    let dark: String
}
