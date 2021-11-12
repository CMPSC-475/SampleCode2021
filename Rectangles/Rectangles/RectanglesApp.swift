//
//  RectanglesApp.swift
//  Rectangles
//
//  Created by Hannan, John Joseph on 11/12/21.
//

import SwiftUI

@main
struct RectanglesApp: App {
    @StateObject var manager = GameManager()
    var body: some Scene {
        WindowGroup {
            GameView()
                .environmentObject(manager)
        }
    }
}
