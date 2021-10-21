//
//  MOFootballersListView.swift
//  Footballers
//
//  Created by jjh9 on 10/19/21.
//

import SwiftUI

struct MOFootballersListView: View {
    @EnvironmentObject var manager : PlayersManager
    @Environment(\.managedObjectContext) private var viewContext

    var footballers : FetchedResults<PlayerMO>
    @State var showingAddPlayer : Bool = false
    
    @State private var searchText = ""
    
    var body: some View {
        List {
            SearchBar(searchText: $searchText)
            ForEach(footballers) {player in
//                if manager.playerSatisfies(player: player, searchText: searchText) {
                    NavigationLink(destination: MOPlayerView(player: player)) {
                        MOPlayerRowView(player: player)
                    }
                //}
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) { Text("Footballers")}
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {showingAddPlayer.toggle()}) {Image(systemName: "plus")}
            }
            
        }
        .sheet(isPresented: $showingAddPlayer) {
            AddPlayerView()
        }

    }
    

}

//struct MOFootballersListView_Previews: PreviewProvider {
//    static var previews: some View {
//        MOFootballersListView()
//    }
//}
