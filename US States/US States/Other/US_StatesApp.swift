//
//  US_StatesApp.swift
//  US States
//
//  Created by Hannan, John Joseph on 9/12/21.
//

import SwiftUI

@main
struct US_StatesApp: App {
    @Environment(\.scenePhase) private var scenePhase
    
    @StateObject var stateManager = StateManager() 
    var body: some Scene {
        WindowGroup {
            HomeView() 
                .environmentObject(stateManager)
        }
        .onChange(of: scenePhase) { phase in
            switch phase {
            case .background:
                stateManager.stateModel.save()
            default:
                break
            }
        }
    }
}
