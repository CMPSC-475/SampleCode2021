//
//  TopAppManager+async.swift
//  Top Apps
//
//  Created by jjh9 on 11/2/21.
//

import Foundation

extension TopAppManager {
    
    func asyncRetrieveData() async {
        let urlString = "https://itunes.apple.com/us/rss/toppaidapplications/limit=100/json"

        let urlSession = URLSession.shared
        let url = URL(string: urlString)!
        
        do {
        let (data,response) = try await urlSession.data(from: url)

            
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {

                //TODO: Handle Error
                DispatchQueue.main.sync {
                httpError = HTTPError(response: response as! HTTPURLResponse)
                }
                return
            }
            
            let _topApps = self.appsFrom(data: data)
            
            DispatchQueue.main.sync {
                self.topApps = _topApps
            }
            
            await self.concurrentRetrieveImages()
        } catch {
            print(error)
            // Retrieve images here for eager version
 
        }
        
    }
    
    func asyncRetrieveImages() async {
        for i in topApps.indices {
            //await asyncRetrieveSingleImage(index: i)
        }
    }
    
    func asyncRetrieveSingleImage(index i:Int) async throws -> Data {
        let url = URL(string: topApps[i].imageURL)!

            let (data,_) = try await URLSession.shared.data(from: url)
            return data

    }
    
    func concurrentRetrieveImages() async {
        do {
            try await withThrowingTaskGroup(of: (Data,Int).self, body: { group in
                for i in topApps.indices {
                    group.addTask {
                        async let data = self.asyncRetrieveSingleImage(index: i)
                        return try await (data, i)
                    }
                }
                for try await (data,i) in group {
                    DispatchQueue.main.async {
                        self.topApps[i].addImageData(data)
                    }
                }
            })
        } catch {
            print("Error")
        }
    }
    
}
