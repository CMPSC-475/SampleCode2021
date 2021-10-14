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

        //TODO: create teams based on all the player's team name
        for player in footballers {
            if let team = _teams.first(where: {(t) -> Bool in t.name == player.teamname}) {
                team.addPlayer(player)
            } else {
                let newTeam = Team(name: player.teamname)
                newTeam.addPlayer(player)
                _teams.append(newTeam)
            }
                
        }
        return  _teams
    }
    
}
