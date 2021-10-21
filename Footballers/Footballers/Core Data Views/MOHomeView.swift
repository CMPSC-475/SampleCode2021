//
//  MOHomeView.swift
//  Footballers
//
//  Created by jjh9 on 10/19/21.
//

import SwiftUI

struct MOHomeView: View {
    @EnvironmentObject var manager : PlayersManager
    @Environment(\.managedObjectContext) private var viewContext

    @AppStorage("isInitial") var isInitial = true
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath:\PlayerMO.lastname, ascending:true)], predicate: nil, animation: .default)
    var players: FetchedResults<PlayerMO>
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath:\TeamMO.name, ascending:true)], predicate: nil, animation: .default)
    var teams: FetchedResults<TeamMO>
    
    var body: some View {
        NavigationView {
        VStack(spacing:60) {
            NavigationLink(destination: MOFootballersListView(footballers: players)) {
                HomeButton(title: "Players")
            }
            NavigationLink(destination: MOTeamListView())  {
                HomeButton(title: "Teams")
            }
        }.accentColor(Color.black)
        }.environmentObject(manager)
            .onAppear {
                if isInitial {
                    addPlayers()
                }
            }
    }
    
    func addPlayers() {
        manager.footballers.forEach { player in
            addPlayer(player: player)
        }
    }
    
    func addPlayer(player:Player) {
        let newPlayer = PlayerMO(context: viewContext)
        newPlayer.firstname = player.firstname
        newPlayer.lastname = player.lastname
        newPlayer.country = player.country
        newPlayer.info = player.info
        if let team = teams.first(where: { (teamMO) in
            teamMO.name == player.teamname }) {
            newPlayer.team = team
            //team.addToRoster(newPlayer)
        } else {
            let newTeam = TeamMO(context: viewContext)
            newTeam.name = player.teamname
            newTeam.addToRoster(newPlayer)
        }
       
    }
}

struct MOHomeView_Previews: PreviewProvider {
    static var previews: some View {
        MOHomeView()
    }
}
