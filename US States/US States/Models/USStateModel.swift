//
//  USStateModel.swift
//  US States
//
//  Created by Hannan, John Joseph on 9/12/21.
//

import Foundation

struct StateModel {
    let manager : StorageManager
    var states : [USState]
    
    init() {
        manager = StorageManager()
        states = manager.states
        
    }
}
