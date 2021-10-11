//
//  StorageManger.swift
//  US States
//
//  Created by jjh9 on 9/14/21.
//

import Foundation

class StorageManager {
    var items : [Item]
    let filename = "ItemData"
    let fileInfo : FileInfo
    
    init() {
        fileInfo = FileInfo(for: filename)
        
        if fileInfo.exists {
            let decoder = JSONDecoder()
            do {
                let data = try Data(contentsOf: fileInfo.url)
                items = try decoder.decode([Item].self, from: data)
            } catch {
                print(error)
                items = []
            }
            return
        }
        
        let bundle = Bundle.main
        let url = bundle.url(forResource: filename, withExtension: ".json")
        
        guard let url = url else {items = []; return}
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            items = try decoder.decode([Item].self, from: data)

        } catch {
            print(error)
            items = []
        }
    }
    
    func save(states:[Item]) {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(states)
            try data.write(to: fileInfo.url)
        } catch {
            print(error)
        }
    }
    
}

