//
//  MOHomeView.swift
//  Footballers
//
//  Created by jjh9 on 10/19/21.
//

import SwiftUI

struct MOHomeView: View {
    @EnvironmentObject var playerModel : PlayersManager
    var body: some View {
        NavigationView {
        VStack(spacing:60) {
            NavigationLink(destination: MOFootballersListView()) {
                HomeButton(title: "Players")
            }
            NavigationLink(destination: MOTeamListView())  {
                HomeButton(title: "Teams")
            }
        }.accentColor(Color.black)
        }.environmentObject(playerModel)
    }
}

struct MOHomeView_Previews: PreviewProvider {
    static var previews: some View {
        MOHomeView()
    }
}
