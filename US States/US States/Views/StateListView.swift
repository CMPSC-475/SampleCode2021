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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct StateListView_Previews: PreviewProvider {
    static var previews: some View {
        StateListView()
    }
}
