//
//  StandigsModel.swift
//  LiguesObserver
//
//  Created by Оливер Салихов on 21.09.2022.
//

import Foundation


struct Standing {
    var teamName: String?
    
    var teamStats: String // 12 элемент
    var gamesPlayed: String // 3 элемент
    var goalsFor: String //4 элемент
    var goalsAgai: String // 5 Элемнт
    var points: String // 6 Элемент
    var pointDifferential: String // 9
    
    enum Stats: String {
        case wins
        case losses
        case ties
        case gamePlayd
        case goalsFor
        case goalgAinsts
        case poinsts
        case pointDiffer
    }
}

struct SeasonRequestData: Decodable {
    let data: SeasonData
}

struct SeasonData: Decodable {
    let name: String
    let abbreviation: String
    let seasonDisplay: String
    let season: Int
    let standings: [StandingData]
}

struct StandingData: Decodable {
    let team: Team
    let stats: [TypeStats]
}

struct Team: Decodable {
    let id: String
    let uid: String
    let location: String
    let name: String
    let abbreviation: String
    let displayName: String
    let logos: [Logo]
}

struct Logo: Decodable {
    let href: String?
}

struct TypeStats: Decodable {
    let displayName: String
    let displayValue: String
}


