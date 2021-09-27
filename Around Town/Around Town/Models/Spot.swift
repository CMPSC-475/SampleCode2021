//
//  Spot.swift
//  Downtown
//
//  Created by Hannan, John Joseph on 9/26/21.
//

import Foundation

struct Spot : Identifiable {
    let coord : Coord
    let title : String?
    let subtitle : String?
    var id = UUID()
    
    init(coord:Coord, title:String? = nil, subtitle:String? = nil) {
        self.coord = coord
        self.title = title
        self.subtitle = subtitle
    }

}


