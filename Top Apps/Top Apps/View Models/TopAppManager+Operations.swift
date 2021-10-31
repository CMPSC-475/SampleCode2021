//
//  TopAppManager+Operations.swift
//  Top Apps
//
//  Created by jjh9 on 10/28/21.
//

import Foundation

extension TopAppManager {
    
    func retrieveWithOperations() {
        let url = URL(string: urlString)!
        let queue = OperationQueue()
        
        let manifestOperation = BlockOperation {
            let data = try? Data(contentsOf: url)
            
            if let data = data {
                let _topApps = self.appsFrom(data: data)
                
                DispatchQueue.main.sync {
                    self.topApps = _topApps
                }
            }
        }
        queue.addOperation(manifestOperation)
        
        let imageOperation = BlockOperation {
            for i in self.topApps.indices {
                let operation = BlockOperation { [self] in
                    let url = URL(string: self.topApps[i].imageURL)!
                    let data = try! Data(contentsOf: url)
                    DispatchQueue.main.sync {
                        self.topApps[i].imageData = data
                    }
                }
                queue.addOperation(operation)
            }
        }
        imageOperation.addDependency(manifestOperation)
        queue.addOperation(imageOperation)
    }
}
