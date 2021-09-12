//
//  HomeView.swift
//  US States
//
//  Created by Hannan, John Joseph on 9/12/21.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var stateManager : StateManager
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
