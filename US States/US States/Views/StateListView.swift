//
//  StateListView.swift
//  US States
//
//  Created by jjh9 on 9/14/21.
//

import SwiftUI

struct StateListView: View {
    @EnvironmentObject var manager : StateManager
    
    var body: some View {
        NavigationView {
        List {
            ForEach(manager.stateModel.states.indices, id:\.self) {i in
                StateRow(state: $manager.stateModel.states[i])

                
          
                
            }
        }
        }
    }
}

struct StateListView_Previews: PreviewProvider {
    static var previews: some View {
        StateListView()
    }
}
