//
//  StateRow.swift
//  US States
//
//  Created by jjh9 on 9/16/21.
//

import SwiftUI

struct StateRow: View {
    @EnvironmentObject var manager : StateManager
    var state : USState
    let height : CGFloat = 40
    var body: some View {

        HStack {
            VStack(alignment:.leading) {
                Text(state.name)
                Text(state.capital).italic()
                Text(manager.formatFor(year: state.year))
            }
            Spacer()
            Image(state.name)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: height)
            VStack {
                Image(systemName: state.visited ? "car.circle.fill" : "car.circle")
                    .foregroundColor(Color.yellow)
                Image(systemName: state.favorite ? "star.fill" : "star")
                    .foregroundColor(Color.green)
            }
        }
        
    }
    
}


struct StateRow_Previews: PreviewProvider {
    static var previews: some View {
        StateRow(state: USState.standard)
    }
}
