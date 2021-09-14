//
//  US_StatesApp.swift
//  US States
//
//  Created by Hannan, John Joseph on 9/12/21.
//

import SwiftUI

@main
struct US_StatesApp: App {
    @StateObject var stateManager = StateManager() 
    var body: some Scene {
        WindowGroup {
            StateListView()
                .environmentObject(stateManager)
        }
    }
}
