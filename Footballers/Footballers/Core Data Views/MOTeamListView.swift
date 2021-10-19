//
//  MOTeamListView.swift
//  Footballers
//
//  Created by jjh9 on 10/19/21.
//

import SwiftUI

struct MOTeamListView: View {
    @EnvironmentObject var manager : PlayersManager

    var body: some View {
        List{
            //TODO:  Create sections for each team. Each section contains all the players on the team roster
            ForEach(manager.teams) {team in
                Section {
                    ForEach (team.roster) {player in
                        PlayerRowView(player: player)
                    }
                    
                } header: {
                    TeamHeaderView(title:team.name)
                }
                
                    
                
            }
        }
    }
}

struct MOTeamListView_Previews: PreviewProvider {
    static var previews: some View {
        MOTeamListView()
    }
}
