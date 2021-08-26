//
//  Color+Random.swift
//  SwiftUI Examples
//
//  Created by jjh9 on 8/26/21.
//

import Foundation
import SwiftUI

extension Color {

    static var randomColor : Color {return Color(red: Double((Int.random(in: 0...255)))/255.0, green: Double((Int.random(in: 0...255)))/255.0, blue: Double((Int.random(in: 0...255)))/255.0 )}

}
