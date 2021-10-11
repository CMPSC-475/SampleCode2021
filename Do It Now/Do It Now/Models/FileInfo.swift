//
//  FileInfo.swift
//  US States
//
//  Created by jjh9 on 9/13/21.
//  Copyright © 2021 jjh9. All rights reserved.
//

import Foundation

/// Convenient struct for generating URL and exists property
/// for a file in the documents directory
struct FileInfo {
    let name : String
    let url : URL
    let exists : Bool
    
    init(for filename:String) {
        name = filename
        let fileManager = FileManager.default
        let documentURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        url =  documentURL.appendingPathComponent(filename + ".json")
        exists = fileManager.fileExists(atPath: url.path)
    }
    
    private init(name:String, url:URL, exists:Bool) {
        self.init(for:"")
    }
}
