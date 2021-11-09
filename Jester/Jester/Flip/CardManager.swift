//
//  CardManager.swift
//  Jester
//
//  Created by Hannan, John Joseph on 11/8/21.
//

import Foundation

enum FlipState {
    case startingFront, endingBack, startingBack, endingFront
}
struct CardData {
    var frontImageName : String
    var backImageName : String
    var flipState : FlipState = .startingFront
    var degrees : Double = 0

    var showingFront : Bool {flipState == .startingFront || flipState == .endingFront}
    var forwardFlip : Bool {(flipState == .startingFront || flipState == .endingBack)}
    var imageName : String {showingFront ? frontImageName :  backImageName}
    
    let frontDegrees : Double = 0.0
    let backDegrees : Double = -180.0
    let midDegrees : Double = -90.0
    
    // showFront & showBack are called at the end of a gesture to complete the rotation to either 0 or 180
    mutating func showFront() {
        degrees = frontDegrees
        flipState = .startingFront
    }
    
    mutating func showBack() {
        degrees = backDegrees
        flipState = .startingBack
    }
    
    // update degrees and flipping state based on the gesture translation value.  Called during the gesture
    mutating func updateWith(_ value: Double) {
        degrees = degreesFrom(value)
        flipState = updateFlip()
    }
    
    // convert a translation value into degrees. Ensure we are always with range (0 to -180).  If we are in the middle of flipping from back to front, degrees starts at -180
    func degreesFrom(_ value: Double) -> Double {
        let newValue = forwardFlip ? value : value - 180 //backflip value starts at 0
        if newValue > frontDegrees {
            return frontDegrees
        } else if newValue < backDegrees {
            return backDegrees
        } else {
            return newValue
        }
    }
    
    // transitions happen when degrees cross the midpoint (90)
    func updateFlip() -> FlipState {
        switch flipState {
        case .startingFront:
            return (degrees < midDegrees) ? .endingBack : .startingFront
        case .endingBack:
            return (degrees < midDegrees) ? .endingBack : .startingFront
        case .startingBack:
            return (degrees < midDegrees) ? .startingBack : .endingFront
        case .endingFront:
            return (degrees < midDegrees) ? .startingBack : .endingFront
            
        }
    }
}

class CardManager : ObservableObject {
    @Published var hamiltonCard = CardData(frontImageName: "Hamilton Front", backImageName: "Hamilton Back")
}
