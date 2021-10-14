//
//  TeamsListView.swift
//  Footballers
//
//  Created by jjh9 on 10/11/21.
//

import SwiftUI

struct TeamsListView: View {
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

struct TeamHeaderView :View {
    var title: String
    var body: some View {
        Text(title).font(Font.largeTitle)
    }
}

struct TeamsListView_Previews: PreviewProvider {
    static var previews: some View {
        TeamsListView()
    }
}
