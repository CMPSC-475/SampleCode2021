//
//  File.swift
//  We Are
//
//  Created by jjh9 on 8/31/21.
//

import Foundation

struct CheerState {
    var mascotImageName :  String
    var cheer1 : String
    var cheer2 : String
    
    var cheerCount = 0
    
    mutating func incrementCheerCount(modul modulus:Int) {
        cheerCount = (cheerCount+1) % modulus
    }
    mutating func changeMascotName(to name: String) {
        mascotImageName = name
    }
    
    mutating func changeCheers(to first:String, and second:String) {
        cheer1 = first
        cheer2 = second
    }
}
