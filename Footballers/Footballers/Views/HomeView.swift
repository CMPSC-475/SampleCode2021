//
//  HomeView.swift
//  Footballers
//
//  Created by jjh9 on 10/11/21.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var playerModel : PlayersManager
    var body: some View {
        NavigationView {
        VStack(spacing:60) {
            NavigationLink(destination: FootballersListView()) {
                HomeButton(title: "Players")
            }
            NavigationLink(destination: TeamsListView())  {
                HomeButton(title: "Teams")
            }
        }.accentColor(Color.black)
        }.environmentObject(playerModel)
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
