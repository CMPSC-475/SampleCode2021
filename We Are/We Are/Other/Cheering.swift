//
//  Cheering.swift
//  WeAre
//
//  Created by jjh9 on 9/2/21.
//

import Foundation

// Protocol used by the CheerManager View Model
protocol Cheering {
    var mascotImageNames : (String,String,String) {get}
    var firstRoundCheers : (String,String) {get}
    var secondRoundCheers : (String,String) {get}
    var firstRoundCount : Int {get}
    var secondRoundCount : Int {get}
}


// We'll initialize our CheerManager with an instance of this.
struct PSUCheers :  Cheering {
    var mascotImageNames = ("Mascot0", "Mascot1", "Mascot1Reversed")
    var firstRoundCheers = ("We Are", "Penn State")
    var secondRoundCheers = ("Thank You", "You're Welcome")
    
    var firstRoundCount = 3
    var secondRoundCount = 1
}
