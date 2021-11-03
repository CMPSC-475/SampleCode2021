//
//  TopAppManager+async.swift
//  Top Apps
//
//  Created by jjh9 on 11/2/21.
//

import Foundation

extension TopAppManager {
    
    func asyncRetrieveData() async {
        let urlSession = URLSession.shared
        let url = URL(string: urlString)!
        
        do {
        let (data,response) = try await urlSession.data(from: url)

            
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {

                //TODO: Handle Error
                DispatchQueue.main.sync {
                httpError = true
                }
                return
            }
            
            let _topApps = self.appsFrom(data: data)
            
            DispatchQueue.main.sync {
                self.topApps = _topApps
            }
            
            await self.asyncRetrieveImages()
        } catch {
            print(error)
            // Retrieve images here for eager version
 
        }
        
    }
    
    func asyncRetrieveImages() async {
        //let urlSession = URLSession.shared
        for i in topApps.indices {
            let url = URL(string: topApps[i].imageURL)!
            do {
                let (data,response) = try await URLSession.shared.data(from: url)
                DispatchQueue.main.async {
                    self.topApps[i].addImageData(data)
                }
            }
            catch {
                print(error)
            }
            
        }
    }
    
}
