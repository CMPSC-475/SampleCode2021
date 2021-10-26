//
//  Top_AppsApp.swift
//  Top Apps
//
//  Created by Hannan, John Joseph on 10/25/21.
//

import SwiftUI

@main
struct Top_AppsApp: App {
    @StateObject var manager = TopAppManager()
    var body: some Scene {
        WindowGroup {
            TopAppsList()
                .environmentObject(manager)
        }
    }
}
