//
//  FootballersListView.swift
//  Footballers
//
//  Created by jjh9 on 10/11/21.
//

import SwiftUI

struct FootballersListView: View {
    @EnvironmentObject var manager : PlayersManager
    @State var showingAddPlayer : Bool = false
    var body: some View {
        List {

            ForEach($manager.footballers) {$player in
                NavigationLink(destination: PlayerView(player: $player)) {
                    PlayerRowView(player: player)
                }
            }
        }
    }
}

struct FootballersView_Previews: PreviewProvider {
    static var previews: some View {
        FootballersListView()
    }
}
