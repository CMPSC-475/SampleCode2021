//
//  PlayersManager.swift
//  Footballers
//
//  Created by jjh9 on 10/11/21.
//

import Foundation
typealias Players = [Player]

class PlayersManager : ObservableObject {
    let storageManager : StorageManager<Player>
    
    typealias Players = [Player]
    @Published var footballers : Players
    @Published var teams : [Team]
    
    init() {
        let _storageManager = StorageManager<Player>(name: "footballers")
        let _footballers = _storageManager.modelData
        teams = []  // need an initial value
        storageManager = _storageManager
        footballers = _footballers
        teams = teams(for: _footballers)
    }
    
    
    //MARK: - Saving Data
    func saveData() {
        storageManager.save(modelData: footballers)
    }
}
