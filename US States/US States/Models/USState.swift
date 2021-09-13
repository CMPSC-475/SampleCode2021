//
//  USState.swift
//  US States
//
//  Created by Hannan, John Joseph on 9/12/21.
//

import Foundation

struct USState  {
    let state : String
    let capital : String
    let info : String
    let year : Int
    let images : [String]
    
    static let standard = USState(state: "Pennsyltucky", capital: "BoonieVille", info: "Welcome to Pennsyltucky", year: 1776, images: [])
}
