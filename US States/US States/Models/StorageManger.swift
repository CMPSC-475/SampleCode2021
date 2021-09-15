//
//  StorageManger.swift
//  US States
//
//  Created by jjh9 on 9/14/21.
//

import Foundation

class StorageManager {
    var states : [USState]
    let filename = "StateData"
    
    init() {
        let bundle = Bundle.main
        let url = bundle.url(forResource: filename, withExtension: ".json")!
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            states = try decoder.decode([USState].self, from: data)

        } catch {
            print(error)
            states = []
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
