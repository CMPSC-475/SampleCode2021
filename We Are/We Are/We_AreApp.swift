//
//  We_AreApp.swift
//  We Are
//
//  Created by jjh9 on 8/26/21.
//

import SwiftUI

@main
struct We_AreApp: App {
    @StateObject var cheerManager = CheerManager()
    
    var body: some Scene {
        WindowGroup {
            WeAreView()
                .environmentObject(cheerManager)
        }
    }
}
