//
//  Do_It_NowApp.swift
//  Do It Now
//
//  Created by jjh9 on 10/11/21.
//

import SwiftUI

@main
struct Do_It_NowApp: App {
    let persistenceController = PersistenceController.shared
    @Environment(\.scenePhase) private var scenePhase

    @StateObject var manager = TaskManager()
    var body: some Scene {
        WindowGroup {
            MOMainView()
                .environmentObject(manager)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .onChange(of: scenePhase) {phase in
                    switch phase {
                    case .inactive:
                        try? persistenceController.container.viewContext.save()
                    default:
                        break
                    }
                }
        }
    }
}
