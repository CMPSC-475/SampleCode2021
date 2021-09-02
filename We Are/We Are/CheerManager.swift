//
//  CheerManager.swift
//  We Are
//
//  Created by jjh9 on 8/31/21.
//

import Foundation
import SwiftUI

class CheerManager :ObservableObject {
    
    //MARK: - Properties
    @Published var cheerState = CheerState(mascotImageName: "Mascot0", cheer1: "We Are", cheer2: "Penn State")
    
    var cheer1Visible  : Bool {gameState == .weare}
    var cheer2Visible : Bool {gameState == .pennstate}
    
    
    
    let weAreRounds = 3
    let thankYouRounds = 1
    var totalCheers : Int {1 + (weAreRounds + thankYouRounds) * 2}
    var currentRound : Int {(cheerState.cheerCount+1)/2}
    var isWeAreRound : Bool { currentRound <= weAreRounds}
    
    enum State {
        case ready, weare, pennstate
    }
    
    var gameState : State  {
        if cheerState.cheerCount == 0 {
            return .ready
        } else if cheerState.cheerCount % 2 == 1 {
            return .weare
        } else {
            return .pennstate
        }
    }
    
    //MARK: - Intents
    func doACheer() {
        
        var weAreText : String {isWeAreRound ? "We Are" : "Thank You"}
        var pennStateText : String {isWeAreRound ? "Penn State" : "You're Welcome"}
        
        var mascotImageName : String {
            switch gameState {
            case .ready :
                return "Mascot0"
            case .weare :
                return "Mascot1"
            case .pennstate :
                return "Mascot1Reversed"
            }
        }
        cheerState.incrementCheerCount(modul: totalCheers)
        cheerState.changeCheers(to: weAreText, and: pennStateText)
        cheerState.changeMascotName(to: mascotImageName)
        
        
    }
}
