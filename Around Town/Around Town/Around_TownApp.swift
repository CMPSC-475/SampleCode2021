//
//  Around_TownApp.swift
//  Around Town
//
//  Created by Hannan, John Joseph on 9/27/21.
//

import SwiftUI

@main
struct Around_TownApp: App {
    @StateObject var manager = MapManager()
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(manager)
        }
    }
}
