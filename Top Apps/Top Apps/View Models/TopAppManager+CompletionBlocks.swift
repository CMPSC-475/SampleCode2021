//
//  TopAppManager+CompletionBlocks.swift
//  Top Apps
//
//  Created by jjh9 on 10/27/21.
//

import Foundation

extension TopAppManager {
    
    func retrieveData() {
        let urlSession = URLSession.shared
        let url = URL(string: urlString)!
        
        let task = urlSession.dataTask(with: url) { [self] data, response, error in
            
            guard (error == nil) else {
                //TODO: Handle Error
                return
            }
            
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {

                //TODO: Handle Error
                return
            }
            
            let _topApps = self.appsFrom(data: data!)
            
            DispatchQueue.main.sync {
                self.topApps = _topApps
            }
            
            // Retrieve images here for eager version
            //self.retrieveImages()
        }
        
        task.resume()
    }
    
    
    func retrieveImages() {
        //let urlSession = URLSession.shared
        for i in topApps.indices {
            appImageData(at: i)
//            let url = URL(string: topApps[i].imageURL)!
//            let task = urlSession.downloadTask(with: url) { imageURL, response , error in
//                guard (error == nil) else {return}
//                if let data = try? Data(contentsOf: imageURL!) {
//                    DispatchQueue.main.async {
//                        self.topApps[i].addImageData(data)
//                    }
//                }
//            }
//            task.resume()
        }
    }
    
    func appImageData(at index:Int) {
        let app = topApps[index]
        guard app.imageData == nil else {return}
        
        let url = URL(string:app.imageURL)!
        let urlSession = URLSession.shared
        let task = urlSession.dataTask(with: url) { (data, response, error) in
            guard error == nil else {return}
            
            DispatchQueue.main.async{
                self.topApps[index].addImageData(data)
            }
        }
        task.resume()
    }
}
