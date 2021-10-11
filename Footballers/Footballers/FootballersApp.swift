//
//  FootballersApp.swift
//  Footballers
//
//  Created by jjh9 on 10/11/21.
//

import SwiftUI

@main
struct FootballersApp: App {
    @StateObject var manager = PlayersManager()
    
    @Environment(\.scenePhase) private var scenePhase
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(manager)
        }
        .onChange(of: scenePhase) {phase in
            switch phase {
            case .inactive:
                manager.saveData()
            default:
                break
            }
        }
    }
}
