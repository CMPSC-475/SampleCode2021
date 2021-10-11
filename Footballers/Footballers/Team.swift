//
//  Team.swift
//  Footballers
//
//  Created by jjh9 on 10/11/21.
//

import Foundation

class Team : Identifiable, Codable {
    var name : String
    var roster : [Player] = []
    var id : String {name}
    
    init(name:String) {
        self.name = name
    }
    
    func addPlayer(_ player:Player) {
        roster.append(player)
        player.team = self
    }
    
    func removePlayer(_ player:Player) {
        roster.removeAll(where: {p in p.fullname == player.fullname})
    }
}
