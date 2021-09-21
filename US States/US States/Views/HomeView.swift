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

    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: StateListView()) {
                    Text("All States")
                }
            }
            .sheet(isPresented: $showPreferences) {
                PreferenceView(showingPreferences: $showPreferences, sectioning: $sectioning)
                
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {showPreferences.toggle()}, label: {
                        Image(systemName: "slider.horizontal.3")
                    })
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
