//
//  MOTeamListView.swift
//  Footballers
//
//  Created by jjh9 on 10/19/21.
//

import SwiftUI

struct MOTeamListView: View {
    @EnvironmentObject var manager : PlayersManager
    var teams : FetchedResults<TeamMO>
    let playerOrder = {(player1:PlayerMO, player2:PlayerMO) -> Bool in player1.lastname < player2.lastname}
    
    var body: some View {
        List{

            ForEach(teams) {team in
                let orderedRoster = (Array(team.roster).sorted(by: playerOrder))
                Section {
                    ForEach (orderedRoster) {player in
                        MOPlayerRowView(player: player)
                    }
                    
                } header: {
                    TeamHeaderView(title:team.name)
                }
                
                    
                
            }
        }
    }
}

//struct MOTeamListView_Previews: PreviewProvider {
//    static var previews: some View {
//        MOTeamListView()
//    }
//}
