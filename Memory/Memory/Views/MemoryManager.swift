//
//  MemoryManager.swift
//  Memory
//
//  Created by jjh9 on 9/6/21.
//

import Foundation

class MemoryManager :ObservableObject {
    @Published var memoryModel = MemoryModel()
    
    //MARK: - Computed Properties -
    var shouldDisableGuessButton : Bool {memoryModel.gameState != .guessing}
    var shouldDisablePlayButton : Bool {memoryModel.gameState == .guessing}
    
    var mainButtonTitle : String {
        switch memoryModel.gameState {
        case .notPlaying:
            return "Play"
        case .lost, .won:
            return "Reset"
        case .memorizing:
            return "Start"
        case .guessing:
            return "--"

        }
    }
    
    private var currentTheme : Theme {
        Themes.themes[memoryModel.preferences.themeIndex]
    }
    
    var gameSequence : [GamePiece] {
        memoryModel.sequence.map {i in currentTheme[i]}
    }
    
    //MARK: - Intents -
    func advanceGameState() {
        memoryModel.advanceGameState()
        if memoryModel.gameState == .memorizing {
            memoryModel.newGame()
        }
    }
    
    func nextGuess(guess i:Int) {
        memoryModel.checkGuess(guess: i)
        
    }
}
