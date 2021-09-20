//
//  USState.swift
//  US States
//
//  Created by Hannan, John Joseph on 9/12/21.
//

import Foundation

struct USState  : Identifiable, Decodable {
    let name : String
    let capital : String
    let info : String
    let year : Int
    let images : [String]
    var visited : Bool
    var favorite : Bool

    var id : String {name}

    static let standard = USState(name: "Alaska", capital: "Juneau", info: "Seward's Folly", year: 1959, images: [], visited: false, favorite: false)
}


extension USState {
    // default image - use flag if no images
    var image : String { images.count > 0 ? images[0] : name }
    
    var centuryFounded: Int { year/100 + 1}
    var decadeFounded : String { String(year/10*10)}
}
