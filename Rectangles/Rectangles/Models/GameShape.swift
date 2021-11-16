//
//  GameShape.swift
//  Rectangles
//
//  Created by Hannan, John Joseph on 11/12/21.
//

import Foundation
import SwiftUI

// Model for a Rectangle
struct GameShape : Identifiable {
    var origin : Point
    var width : Double
    var height : Double
    let colorRGB = (Double.random(in: 0...1), Double.random(in: 0...1), Double.random(in: 0...1))
    let id = UUID()
    
    static var standard = GameShape(origin: Point(x: 100, y: 100), width: 50, height: 50)
    
}

// Convenience Computed Properties
extension GameShape {
    var ending : Point {
        get { Point(x: origin.x + width, y: origin.y + height)}
        set(newValue) {
            width = newValue.x - origin.x
            height = newValue.y - origin.y
        }
    }
}

// functions
extension GameShape {
    
 
}
