//
//  Restaurant.swift
//  Downtown
//
//  Created by Hannan, John Joseph on 10/1/21.
//

import Foundation

struct Restaurant : Codable {
    var name : String
    var address : String
    
    static var restaurants : [Restaurant] {
        var res : [Restaurant] = []
        let restaurantURL = Bundle.main.url(forResource: "Restaurants", withExtension: "json")!
        do {
            let data = try Data(contentsOf: restaurantURL)
            let decoder = JSONDecoder()
            res = try decoder.decode([Restaurant].self, from: data)
        } catch   {
            print("Error decoding Restaurants: \(error)")
            res = []
        }
        return res
    }
}
