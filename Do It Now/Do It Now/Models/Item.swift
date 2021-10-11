//
//  Item.swift
//  Do It Now
//
//  Created by jjh9 on 10/11/21.
//

import Foundation


struct Item : Codable, Identifiable {
    var title : String
    var date = Date()
    var done = false
    var id = UUID()
    
    static let standard = Item(title: "Do Nothing")
}
