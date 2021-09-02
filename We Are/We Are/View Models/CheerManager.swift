//
//  CheerManager.swift
//  We Are
//
//  Created by jjh9 on 8/31/21.
//

import Foundation
import SwiftUI

class CheerManager :ObservableObject {
    var cheering: Cheering // Cheering protocol defines properties for all the constants we need
    
    // the cheerState initialization depends upon the cheering parameter.  Because of this we need to initialize cheerState here in the initializer
    init(cheering:Cheering) {
        self.cheering = cheering
        cheerState = CheerState(mascotImageName: cheering.mascotImageNames.0, cheer1: cheering.firstRoundCheers.0, cheer2: cheering.firstRoundCheers.1)
    }
    
    
    //MARK: - Properties
    @Published var cheerState : CheerState
    
    // changes to these computed properties' values will always occur as a result of a published property (cheerState) being modified. So it's safe for the views to use these.
    var cheer1Visible  : Bool {gameState == .weare}
    var cheer2Visible : Bool {gameState == .pennstate}
    
    
    //MARK - Private State
    private var totalCheers : Int {1 + (cheering.firstRoundCount + cheering.secondRoundCount) * 2}
    private var currentRound : Int {(cheerState.cheerCount+1)/2}
    private var isWeAreRound : Bool { currentRound <= cheering.firstRoundCount}
    
    private enum State {
        case ready, weare, pennstate
    }
   
    private var gameState : State  {
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
        
        var weAreText : String {isWeAreRound ? cheering.firstRoundCheers.0 : cheering.secondRoundCheers.0}
        var pennStateText : String {isWeAreRound ? cheering.firstRoundCheers.1 : cheering.secondRoundCheers.1}
        
        var mascotImageName : String {
            switch gameState {
            case .ready :
                return cheering.mascotImageNames.0
            case .weare :
                return cheering.mascotImageNames.1
            case .pennstate :
                return cheering.mascotImageNames.2
            }
        }
        cheerState.incrementCheerCount(modulo: totalCheers)
        cheerState.changeCheers(to: weAreText, and: pennStateText)
        cheerState.changeMascotName(to: mascotImageName)
        
        
    }
}
