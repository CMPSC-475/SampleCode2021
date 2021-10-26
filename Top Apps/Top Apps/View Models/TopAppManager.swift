//
//  TopAppManager.swift
//  Top Apps
//
//  Created by Hannan, John Joseph on 10/25/21.
//

import Foundation

class TopAppManager : ObservableObject{
    @Published var topApps = [AppInfo]()
    private let urlString = "https://itunes.apple.com/us/rss/toppaidapplications/limit=100/json"

    //TODO: retrieve app data
}
