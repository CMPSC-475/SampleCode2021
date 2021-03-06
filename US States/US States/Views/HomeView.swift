//
//  HomeView.swift
//  US States
//
//  Created by Hannan, John Joseph on 9/12/21.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var stateManager : StateManager
    @State private var showPreferences : Bool = false
    @AppStorage(Storage.sectioning) var sectioning : Sectioning = .none
    @AppStorage(Storage.homeStateIndex) var homeStateIndex : Int?
    
    
    var body: some View {
        NavigationView {
            List {
                
                if let index = homeStateIndex {
                Text("Home State: \(index)")
                }
                NavigationLink(destination: StateListView()) {
                    Text("All States")
                }
            }
            .sheet(isPresented: $showPreferences) {
                PreferenceView(showingPreferences: $showPreferences)
                
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {showPreferences.toggle()}, label: {
                        Image(systemName: "slider.horizontal.3")
                    })
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
