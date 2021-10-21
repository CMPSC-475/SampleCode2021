//
//  MOPlayerRowView.swift
//  Footballers
//
//  Created by jjh9 on 10/19/21.
//

import SwiftUI

struct MOPlayerRowView: View {
    let player : PlayerMO
    var body: some View {
        VStack(alignment:.leading) {
        Text(player.fullname)
            Text(player.team.name).italic()
        }
    }
}

//struct MOPlayerRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        MOPlayerRowView()
//    }
//}
