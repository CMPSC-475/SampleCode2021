//
//  FootballersApp.swift
//  Footballers
//
//  Created by jjh9 on 10/11/21.
//

import SwiftUI

@main
struct FootballersApp: App {
    let persistenceController = PersistenceController.shared
    @StateObject var manager = PlayersManager()
    
    @Environment(\.scenePhase) private var scenePhase
    var body: some Scene {
        WindowGroup {
            MOHomeView()
                .environmentObject(manager)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
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
