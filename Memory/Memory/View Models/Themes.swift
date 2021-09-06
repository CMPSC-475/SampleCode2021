//
//  Themes.swift
//  Memory
//
//  Created by jjh9 on 9/10/20.
//  Copyright © 2020 jjh9. All rights reserved.
//

import SwiftUI
typealias Theme = [GamePiece]

struct Themes {
    static let colors : [GamePiece]  = [Color.red, .blue, .green, .yellow].map {GamePiece(background: $0, title: "")}
    static let numbers  = ["1", "2", "3", "4"].map {GamePiece(background: .yellow, title: $0) }
    static let chess  = ["♚", "♛", "♜", "♞"].map {GamePiece(background: .yellow, title: $0) }
    static let sports  = ["🏀", "⚾️", "🏈", "⚽️"].map {GamePiece(background: .clear, title: $0) }
    static let suits  = ["♠︎", "♣︎", "♥︎", "♦︎"].map {GamePiece(background: .yellow, title: $0) }
    static let flowers = ["🌼", "🌹", "🌻", "🌸"].map {GamePiece(background: .clear, title: $0) }
    static let themes = [Self.colors, numbers, chess, sports, suits, flowers]
    

}
