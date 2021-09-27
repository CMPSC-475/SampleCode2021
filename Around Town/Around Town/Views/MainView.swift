//
//  MainView.swift
//  Mappy
//
//  Created by Hannan, John Joseph on 9/26/21.
//

import SwiftUI
import MapKit

struct MainView: View {
    @EnvironmentObject var manager : MapManager

    var body: some View {
        
        NavigationView {
         
            DowntownMap()
                .toolbar {
                    searchBarItem
                }
        }
    }
    
    
    // some local variables
    var searchBarItem = ToolbarItem(placement: .navigationBarTrailing) {
                            SearchButton()
                        }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MainView()
                .environmentObject(MapManager())
        }
    }
}



