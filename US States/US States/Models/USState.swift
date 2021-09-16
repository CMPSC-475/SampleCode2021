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
    var id : String {name}
    
    static let standard = USState(name: "Pennsyltucky", capital: "BoonieVille", info: "Welcome to Pennsyltucky", year: 1776, images: [], visited: false)
}
