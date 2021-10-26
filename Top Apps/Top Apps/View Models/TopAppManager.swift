//
//  TopAppManager.swift
//  Top Apps
//
//  Created by Hannan, John Joseph on 10/25/21.
//

import Foundation

class TopAppManager : ObservableObject{
    // downloaded app information
    @Published var topApps = [AppInfo]()
    
    //json feed from Apple for Top Paid Apps
    private let urlString = "https://itunes.apple.com/us/rss/toppaidapplications/limit=100/json"

    //TODO: retrieve app data
    init() {
        retrieveData()
    }
    
    func retrieveData() {
        let urlSession = URLSession.shared
        let url = URL(string: urlString)!
        
        let task = urlSession.dataTask(with: url) { [self] data, response, error in
            guard (error == nil) else {return}
            
            let _topApps = self.appsFrom(data: data!)
            
            DispatchQueue.main.sync {
                self.topApps = _topApps
            }
            
            self.retrieveImages()
        }
        
        task.resume()
    }
    
    func retrieveImages() {
        let urlSession = URLSession.shared
        for i in topApps.indices {
            let url = URL(string: topApps[i].imageURL)!
            let task = urlSession.downloadTask(with: url) { imageURL, response , error in
                guard (error == nil) else {return}
                if let data = try? Data(contentsOf: imageURL!) {
                    DispatchQueue.main.async {
                        self.topApps[i].addImageData(data)
                    }
                }
                
            }
            task.resume()
        }
    }
    
    func  appsFrom(data:Data) -> [AppInfo] {
        let _topApps : [AppInfo]
        let decoder = JSONDecoder()
        do {
            let apps = try decoder.decode(TopAppData.self, from: data)
            let entries = apps.feed.entry
            _topApps = entries.map {AppInfo(entry: $0)}
            
        } catch {
            _topApps = []
        }
        
        return _topApps
    }
}
