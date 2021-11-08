//
//  Manager.swift
//  Gess
//
//  Created by Hannan, John Joseph on 11/7/21.
//

import Foundation
import SwiftUI

enum Status {
    case unDecided, kept, traded
}

struct CardInfo :Identifiable {
    let id : Int
    var status : Status
    
    static var standard = CardInfo(id: 101, status: .unDecided)
}

class Manager :ObservableObject {
    
    @Published var kept = [Int]()
    @Published var traded = [Int]()
    @Published var cards : [CardInfo]
    
    init() {
        let cardNumbers = Array(101...123)
        cards = cardNumbers.map {CardInfo(id: $0, status: .unDecided)}
    }
    
    func keptCard(number: Int) {
        kept.append(number)
    }
    func tradedCard(number: Int) {
        traded.append(number)
    }
    
    func reset() {
        for i in cards.indices {
            cards[i].status = .unDecided
        }
        kept.removeAll()
        traded.removeAll()
    }
}
