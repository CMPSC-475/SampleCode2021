//
//  PlayerRowView.swift
//  Footballers
//
//  Created by jjh9 on 10/11/21.
//

import SwiftUI

struct PlayerRowView: View {
    let player : Player
    var body: some View {
        VStack {
        Text(player.fullname)
        Text(player.teamname).italic()
        }
    }
}

struct PlayerRowView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerRowView(player: Player.standard)
    }
}
