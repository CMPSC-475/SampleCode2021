//
//  RootView.swift
//  Around Town
//
//  Created by Hannan, John Joseph on 6/21/22.
//

import SwiftUI

struct RootView: View {
    var body: some View {
        TabView {
            MainView()
                .tabItem {
                    Label("Map", systemImage: "map")
                }
            
            MapUIView()
                .tabItem {
                    Label("MapUI", systemImage: "map")
                }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
