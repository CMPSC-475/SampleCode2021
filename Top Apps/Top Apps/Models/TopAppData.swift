//
//  TopAppData.swift
//  Top Apps
//
//  Created by Hannan, John Joseph on 10/25/21.
//
//  Created by John Hannan on 11/14/19.
//  Copyright © 2019 John Hannan. All rights reserved.
//
//  Created by John Hannan on 11/9/18.
//  Copyright © 2018 John Hannan. All rights reserved.
//
//  Data parsed from JSON

import Foundation


// Structs for decoding JSON
// TopAppData is the top-level struct we decode the JSON into
struct TopAppData : Decodable {
    let feed : Feed
    
    private enum CodingKeys: String, CodingKey {
        case feed
    }
    
    struct Feed : Decodable {
        let entry : [Entry]
        private enum CodingKeys: String, CodingKey {
            case entry
        }
    }
}

// Struct representing one App from the JSON
struct Entry : Decodable {
    let title : [String:String]
    let summary : [String:String]
    let imageURLs : [ImageURL]
    
    private enum CodingKeys: String, CodingKey {
        case title
        case summary
        case imageURLs = "im:image"
    }
    
    struct ImageURL : Decodable {
        let urlString : String
        private enum CodingKeys: String, CodingKey {
            case urlString = "label"
        }
    }
}

// This is the struct we use to model an individual app
struct AppInfo : Identifiable {
    let title:String
    let author:String
    let imageURL:String
    var imageData : Data?
    let summary:String
    let id = UUID()
    
    init(entry:Entry) {
        let titleAuthor = entry.title["label"] ?? " "
        let split = titleAuthor.components(separatedBy: "-")
        self.title = split[0]
        self.author = split[1]
        self.summary = entry.summary["label"] ?? " "
        imageURL = entry.imageURLs[0].urlString
        imageData = nil
    }
    
    mutating func addImageData(_ data: Data?) {
        imageData = data
    }
    init(title:String, author:String, imageURL:String, summary:String) {
        self.title = title
        self.author = author
        self.imageURL = imageURL
        self.summary = summary
    }
    
    static let standard = AppInfo(title: "Minecraft - Mojang", author: "Unknown",
        imageURL: "https://is4-ssl.mzstatic.com/image/thumb/Purple115/v4/5a/db/b6/5adbb619-2093-6e6a-1c3e-6b5260aa9465/AppIcon-0-0-1x_U007emarketing-0-0-0-9-0-0-sRGB-0-0-0-GLES2_U002c0-512MB-85-220-0-0.png/53x53bb.png",
        summary: "Explore infinite worlds and build everything from the simplest of homes to the grandest of castles. Play in creative mode with unlimited resources or mine deep into the world in survival mode, crafting weapons and armor to fend off dangerous mobs. Create, explore and survive alone or play with friends on all different devices. \n\nEXPAND YOUR GAME:\nMarketplace - Discover the latest community creations in the marketplace! Get unique maps, skins, and texture packs from your favorite creators.\n\nSlash commands - Tweak how the game plays: you can give items away, summon mobs, change the time of day, and more. \n\nAdd-Ons - Customize your experience even further with free Add-Ons! If you\'re more tech-inclined, you can modify data-driven behaviors in the game to create new resource packs.\n\nMinecraft Realms auto-renewable subscription info:\n\nMinecraft now comes with the option to buy Minecraft Realms. Realms is a monthly subscription service that lets you create your own always-online Minecraft world.\nThere are currently two subscription options to choose from depending on how many people you want to invite to play in your realm simultaneously. A realm for you and 2 friends costs 3.99 USD/month (or local equivalent) and a realm for you and 10 friends cost 7.99 USD/month (or local equivalent).\nA 30-day trial of Minecraft Realms for you and 10 friends is available. Any unused portion of a free trial period will be forfeited when the user purchases a subscription.\n\nThe payment will be charged to your iTunes account at confirmation of purchase and the subscription automatically renews unless auto-renew is turned off at least 24-hours before the end of the current period. Your account will be charged for renewal within 24-hours prior to the end of the current period, at the subscription price option you have previously selected.\n\nYour subscription can be managed by the user and auto-renewal may be turned off by going to the user\'s Account Settings after purchase. There is also a button in-game that take you to these settings. If you cancel after your subscription has activated, you won\'t be refunded for the remaining active period of the subscription.\n\nHere are links to our privacy policy and terms of use:\n- Privacy policy: https://account.mojang.com/terms#privacy\n- Terms of use: https://account.mojang.com/terms")

}

