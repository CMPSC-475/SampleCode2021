//
//  MemoryManager.swift
//  Memory
//
//  Created by jjh9 on 9/6/21.
//

import Foundation
import SwiftUI

class MemoryManager :ObservableObject {
    @Published var memoryModel = MemoryModel()
    
    //MARK: - Computed Properties -
    var shouldDisableGuessButton : Bool {memoryModel.gameState != .guessing}
    var shouldDisablePlayButton : Bool {memoryModel.gameState == .guessing}
    var memorizeLabelVisible : Bool {memoryModel.gameState == .memorizing}
    
    // how many dots are shown?  All of them if we're showing the user the initial sequence or if all guessed correctly.  Otherwise only ones they've guessed correctly so far
    var visibleSequenceCount : Int  {
        switch memoryModel.gameState {
        case .memorizing, .won, .lost:
            return memoryModel.sequence.count
        case .guessing:
            return memoryModel.currentGuessIndex
        default:
            return 0
        }
    }
    
    var background : Color {
        switch memoryModel.gameState {
        case .notPlaying:
            return ViewConstants.notPlayingBackgroundColor
        case .memorizing:
            return ViewConstants.memorizingBackgroundColor
        case .guessing:
            return ViewConstants.guessingBackgroundColor
        case .lost:
            return ViewConstants.lostBackgroundColor
        case .won:
            return ViewConstants.wonBackgroundColor
        }
    }
    
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
    

    
    var gameSequence : [GamePiece] {
        memoryModel.sequence.map {i in currentTheme[i]}
    }
    private var currentTheme : Theme {
        Themes.themes[memoryModel.preferences.themeIndex]
    }
    
    
    //MARK: - View Customization -
    // What game piece to display for button with index i
    func gamePieceFor(index i: Int) -> GamePiece {
        currentTheme[i]
    }
    
    private var currentGuessIndex : Int {memoryModel.currentGuessIndex-1}
    // scale factor for sequence pieces - enlarge current guess
    func scaleForPieceAt(index i:Int) -> CGFloat {
        i == currentGuessIndex ? 1.2 : 1
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
