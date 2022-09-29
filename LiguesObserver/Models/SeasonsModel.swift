//
//  SeasonsModel.swift
//  LiguesObserver
//
//  Created by Оливер Салихов on 20.09.2022.
//

import Foundation

struct SeasonsData: Decodable {
    let data: Seasons
}

struct Seasons: Decodable {
    let seasons: [Season]
}

struct Season: Decodable {
    let year: Int
    let startDate: String
    let endDate: String
    let displayName: String
    let types: [TypeSeason]
}

struct TypeSeason: Decodable {
    let id: String
    let name: String
    let abbreviation: String
    let startDate: String
    let endDate: String
    let hasStandings: Bool
}

