//
//  StorageManger.swift
//  US States
//
//  Created by jjh9 on 9/14/21.
//

import Foundation

class StorageManager<T:Codable> {
    var modelData : [T]
    let filename : String
    let fileInfo : FileInfo
    
    init(name:String) {
        filename = name
        fileInfo = FileInfo(for: filename)
        
        if fileInfo.exists {
            let decoder = JSONDecoder()
            do {
                let data = try Data(contentsOf: fileInfo.url)
                modelData = try decoder.decode([T].self, from: data)
            } catch {
                print(error)
                modelData = []
            }
            return
        }
        
        let bundle = Bundle.main
        let url = bundle.url(forResource: filename, withExtension: ".json")
        
        guard let url = url else {modelData = []; return}
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            modelData = try decoder.decode([T].self, from: data)

        } catch {
            print(error)
            modelData = []
        }
    }
    
    func save(modelData:[T]) {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(modelData)
            try data.write(to: fileInfo.url)
        } catch {
            print(error)
        }
    }
    
}

/*
 } catch let DecodingError.dataCorrupted(context) {
     print(context)
     states = []
 } catch let DecodingError.keyNotFound(key, context) {
     print("Key '\(key)' not found:", context.debugDescription)
     print("codingPath:", context.codingPath)
     states = []
 } catch let DecodingError.valueNotFound(value, context) {
     print("Value '\(value)' not found:", context.debugDescription)
     print("codingPath:", context.codingPath)
     states = []
 } catch let DecodingError.typeMismatch(type, context)  {
     print("Type '\(type)' mismatch:", context.debugDescription)
     print("codingPath:", context.codingPath)
     states = []
 } catch {
     print("error: ", error)
     states = []
 }
 */
