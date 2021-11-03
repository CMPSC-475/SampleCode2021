//
//  HTTPError.swift
//  Top Apps
//
//  Created by jjh9 on 11/3/21.
//

import Foundation

struct HTTPError : Error, Identifiable {
    var response: HTTPURLResponse
    var id = UUID()
}
