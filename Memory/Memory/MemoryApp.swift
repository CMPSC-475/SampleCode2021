//
//  MemoryApp.swift
//  Memory
//
//  Created by jjh9 on 9/6/21.
//

import SwiftUI

@main
struct MemoryApp: App {
    @StateObject var memoryManager = MemoryManager()
    
    var body: some Scene {
        WindowGroup {
            MemoryView()
                .environmentObject(memoryManager)
        }
    }
}
