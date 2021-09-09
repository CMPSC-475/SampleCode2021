//
//  Preferences.swift
//  Memory
//
//  Created by jjh9 on 9/5/21.
//  Copyright © 2021 jjh9. All rights reserved.
//

import Foundation

struct Preferences {
    var themeIndex : Int
    var sequenceLength : Int 
    
    static let standard = Preferences(themeIndex: 0, sequenceLength: 5)
}
