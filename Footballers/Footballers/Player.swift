//
//  Player.swift
//  Footballers
//
//  Created by jjh9 on 10/11/21.
//

import Foundation

class Player : Codable, Identifiable {
    let firstname : String
    let lastname : String
    let rank : Int
    let country : String
    let teamname : String
    var info : String
    var isFavorite : Bool
    var team : Team?
    
    
    var fullname : String {return firstname + " " + lastname}
    //var teamname : String {return team}
    var id : String {fullname}

    static let standard = Player(firstname: "Alexi", lastname: "Lalas", team: "Barcelona", country: "United States")
    
    enum CodingKeys : String, CodingKey {
        case firstname
        case lastname
        case rank
        case country = "home"
        case teamname = "team"
        case info
        case isFavorite
    }
    
    init(firstname: String, lastname: String, team: String, country: String) {
        self.firstname = firstname
        self.lastname = lastname
        self.teamname = team
        self.country = country
        self.rank = 0
        self.info = ""
        self.isFavorite = false
    }
}
