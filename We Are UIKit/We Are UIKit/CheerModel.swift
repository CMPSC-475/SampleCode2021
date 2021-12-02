//
//  CheerModel.swift
//  We Are UIKit
//
//  Created by jjh9 on 11/29/20.
//

import Foundation

enum CheerState {
    case starting
    case cheering
    case thanking
    case resetting
}

class CheerModel {
    
    var cheerCount = 0
    let numberOfRounds = 3   // 3 rounds of "We Are!  Penn State!
    
    var isEvenCheerCount : Bool {return cheerCount%2 == 0}
    var isResetting : Bool {return cheerState == .resetting || cheerState == .starting}
    
    var mascotImageName : String {
        switch cheerState {
        case .starting,.resetting:
            return "Mascot0"
        default:
            return isEvenCheerCount ? "Mascot2" : "Mascot1"
        }
    }
    
    var weAreText : String {
        switch cheerState {
        case .thanking:
            return "Thank You"
        default:
            return "We Are"
        }
    }
    

    var pennStateText : String {
        switch cheerState {
        case .thanking:
            return "You're Welcome"
        default:
            return "Penn State"
        }
    }
    
    // a Computed Property to maintain current state of cheering (what signs to display)
    var cheerState : CheerState {
        switch cheerCount {
        case 0:
            return .starting
        case 1...numberOfRounds*2:
            return .cheering
        case numberOfRounds*2 + 1..<numberOfRounds*2 + 3:
            return .thanking
        default:
            return .resetting
        }
    }
    
    func incrementCheer() {
        cheerCount += 1
        if cheerState == .resetting {
            cheerCount = 0
        }
    }
}
