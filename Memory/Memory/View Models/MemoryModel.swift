//
//  MemoryModel.swift
//  Memory
//
//  Created by jjh9 on 9/6/21.
//

import Foundation

struct MemoryModel {
    
    var sequence : [Int] = []
    var currentGuessIndex = 0
    var preferences = Preferences.standard
    
    enum GameState {
        case notPlaying, memorizing, guessing, lost, won
    }
    
    var gameState : GameState = .notPlaying
    
    
    //MARK: - Business Logic -
    
    mutating func newGame() {
        
        sequence.removeAll()
        gameState = .memorizing
        currentGuessIndex = 0

        for _ in (0..<preferences.sequenceLength) {
            let randomIndex = Int.random(in: 0..<GameConstants.numberOfChoices)
            sequence.append(randomIndex)
        }
    }
    
    mutating func incrementGuessIndex() {
        self.currentGuessIndex += 1
    }
    
    mutating func checkGuess(guess:Int) {
        let isCorrect = (guess == sequence[currentGuessIndex])
        let isDone = (currentGuessIndex == sequence.count-1)
        
        if isCorrect {
            if isDone {
                gameState = .won
            } else {
                incrementGuessIndex()
            }
        } else {
            gameState = .lost
            
        }
    }
    
    mutating func advanceGameState() {
        switch gameState {
        case .lost, .won:
            gameState = .memorizing
        case .notPlaying:
            gameState = .memorizing
        case .memorizing:
            gameState = .guessing
        default:
            assert(false, "Button should be disabled while guessing")
        }
    }
    
}
