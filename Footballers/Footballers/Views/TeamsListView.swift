//
//  TeamsListView.swift
//  Footballers
//
//  Created by jjh9 on 10/11/21.
//

import SwiftUI

struct TeamsListView: View {
    @EnvironmentObject var playerModel : PlayersManager

    var body: some View {
        List{
            ForEach(playerModel.teams) {team in
                Section(header: TeamHeaderView(title: team.name)) {
                    ForEach($playerModel.footballers) {$player in
                        if player.team?.name == team.name {
                        NavigationLink(destination: PlayerView(player: $player)) {
                            PlayerRowView(player: player)
                        }
                        }
                    }
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
