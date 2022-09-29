//
//  LiguesLocaleStore.swift
//  LiguesObserver
//
//  Created by Оливер Салихов on 19.09.2022.
//

import Foundation


class LiguesLocaleStore {
    static var shared = LiguesLocaleStore()
    
    var liguesData: [LigueModel] = []
    var seasonsData: [Season] = []
    var seasonData: SeasonData?
    var standings: [StandingData] = []
    
    var logoCahce = NSCache<AnyObject, AnyObject>()
}
