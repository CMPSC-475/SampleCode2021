//
//  USState+Decodable.swift
//  US States
//
//  Created by jjh9 on 9/15/21.
//

import Foundation

extension USState  {
    
    enum CodingKeys: String, CodingKey {
    case name = "state"
    case capital
        case info
        case year
        case images
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(String.self, forKey: .name)
        capital = try values.decode(String.self, forKey: .capital)
        info = try values.decode(String.self, forKey: .info)
        year = try values.decode(Int.self, forKey: .year)
        images = try values.decode([String].self, forKey: .images)
        visited = false
        favorite = false
    }
}
