//
//  StateRow.swift
//  US States
//
//  Created by jjh9 on 9/16/21.
//

import SwiftUI

struct StateRow: View {
    var state : USState
    let height : CGFloat = 40
    var body: some View {

        HStack {
            Text(state.name)
            Spacer()
            Image(state.name)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: height)
            Image(systemName: state.visited ? "star.fill" : "star")
        }
        
    }
    
}


struct StateRow_Previews: PreviewProvider {
    static var previews: some View {
        StateRow(state: USState.standard)
    }
}
