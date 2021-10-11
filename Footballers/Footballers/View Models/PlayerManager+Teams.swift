//
//  PlayerManager+Teams.swift
//  Footballers
//
//  Created by jjh9 on 10/11/21.
//

import Foundation

extension PlayersManager {
    
    func teams(for footballers: [Player]) -> [Team] {
        
        var _teams = [Team]()
        for p in footballers {
            if let teamIndex = _teams.firstIndex(where: { (team) -> Bool in
                team.name == p.teamname
            }) {
                _teams[teamIndex].addPlayer(p)
            } else {
                let newTeam = Team(name: p.teamname)
                newTeam.addPlayer(p)
                _teams.append(newTeam)
            }
        }
        return  _teams
    }
    
}
