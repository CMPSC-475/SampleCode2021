//
//  SectionView.swift
//  US States
//
//  Created by Hannan, John Joseph on 9/11/21.
//  Copyright © 2021 jjh9. All rights reserved.
//

import SwiftUI

struct SectionView: View {
    @EnvironmentObject var manager : StateManager
    let indices : [Int]
    
    var body: some View {
        ForEach(indices, id: \.self) { index in
            NavigationLink(destination: DetailView(state: $manager.stateModel.states[index])) {
                StateRow(state: manager.stateModel.states[index])
            }
        }
    }
}

struct SectionView_Previews: PreviewProvider {
    static var previews: some View {
        SectionView(indices: [0,1,2,3])
            .environmentObject(StateManager())
    }
}
