//
//  CardManager.swift
//  Jester
//
//  Created by Hannan, John Joseph on 11/8/21.
//

import Foundation

enum CardFlipping {
    case startingFront, endingBack, startingBack, endingFront
}
struct CardState {
    var frontImageName : String
    var backImageName : String
    var flipping : CardFlipping = .startingFront
    var degrees : Double = 0

    var showingFront : Bool {flipping == .startingFront || flipping == .endingFront}
    var forwardFlip : Bool {(flipping == .startingFront || flipping == .endingBack)}
    var imageName : String {showingFront ? frontImageName :  backImageName}
    
    let frontDegrees : Double = 0.0
    let backDegrees : Double = -180.0
    let midDegrees : Double = -90.0
    
    mutating func showFront() {
        degrees = frontDegrees
        flipping = .startingFront
    }
    
    mutating func showBack() {
        degrees = backDegrees
        flipping = .startingBack
    }
    
    // update degrees and flipping state based on the gesture translation value
    mutating func updateWith(_ value: Double) {
        degrees = degreesFrom(value)
        flipping = updateFlip()
    }
    
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
    
    func updateFlip() -> CardFlipping {
        switch flipping {
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
    @Published var cardState = CardState(frontImageName: "Hamilton Front", backImageName: "Hamilton Back")
}
