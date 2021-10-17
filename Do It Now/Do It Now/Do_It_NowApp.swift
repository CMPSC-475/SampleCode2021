//
//  Do_It_NowApp.swift
//  Do It Now
//
//  Created by jjh9 on 10/11/21.
//

import SwiftUI

@main
struct Do_It_NowApp: App {
    @StateObject var manager = TaskManager()
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(manager)
        }
    }
}
