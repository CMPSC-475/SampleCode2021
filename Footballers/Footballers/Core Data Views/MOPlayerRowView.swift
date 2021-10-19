//
//  MOPlayerRowView.swift
//  Footballers
//
//  Created by jjh9 on 10/19/21.
//

import SwiftUI

struct MOPlayerRowView: View {
    let player : Player
    var body: some View {
        VStack {
        Text(player.fullname)
        Text(player.teamname).italic()
        }
    }
}

//struct MOPlayerRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        MOPlayerRowView()
//    }
//}
