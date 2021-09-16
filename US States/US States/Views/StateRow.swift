//
//  StateRow.swift
//  US States
//
//  Created by jjh9 on 9/16/21.
//

import SwiftUI

struct StateRow: View {
    @Binding var state : USState
    var body: some View {
        
        HStack {
            NavigationLink(destination: DetailView(state: $state),
                           label: {
                            Text(state.name)
                           })
            Spacer()
            Image(systemName: state.visited ? "star.fill" : "star")
        }
        
    }
}

//struct StateRow_Previews: PreviewProvider {
//    static var previews: some View {
//        StateRow()
//    }
//}
