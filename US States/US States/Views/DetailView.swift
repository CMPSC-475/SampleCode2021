//
//  DetailView.swift
//  US States
//
//  Created by jjh9 on 9/11/20.
//  Copyright © 2020 jjh9. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var manager: StateManager
    @Binding var state : USState
    
    var body: some View {
            List {
                HStack {
                    Text("Visited")
                
                    Button(action: {state.visited.toggle()}, label: {
                    Image(systemName: state.visited ? "star.fill" : "star")

                })
                }
                Text(state.info)
            }
            .navigationBarTitle(state.name)

    }
}

struct DetailView_Previews: PreviewProvider {

    static var previews: some View {
        DetailView(state: .constant(USState.standard))
            .environmentObject(StateManager())
    }
}

