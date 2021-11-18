//
//  GameShape.swift
//  Rectangles
//
//  Created by Hannan, John Joseph on 11/12/21.
//

import Foundation
import SwiftUI

// Model for a Rectangle
struct GameShape : Identifiable, Equatable {
    var origin : Point
    var width : Double = 0
    var height : Double = 0
    let colorRGB = (Double.random(in: 0...1), Double.random(in: 0...1), Double.random(in: 0...1))
    var zIndex : Double

    let id = UUID()
    
    static var standard = GameShape(origin: Point(x: 100, y: 100), width: 50, height: 50, zIndex: 0.0)
    
    static func ==(lhs:GameShape, rhs:GameShape) -> Bool {
        lhs.id == rhs.id
    }
    
}

// Convenience Computed Properties
extension GameShape {
    var center : Point {
        get {return Point(x: origin.x + width/2, y: origin.y + height/2)}
        set(newValue) {
            origin = Point(x: newValue.x - width/2, y: newValue.y - height/2)
        }
    }
    
    var ending : Point {
        get { Point(x: origin.x + width, y: origin.y + height)}
        set(newValue) {
            width = newValue.x - origin.x
            height = newValue.y - origin.y
        }
    }
    
    var area : Double {
            return width * height
    }
}

// functions
extension GameShape {
    
    // account for negative widths & heights
    mutating func standardized() {
        if width < 0 {
            origin = Point(x: ending.x, y: origin.y)
            width = -width
        }
        if height < 0 {
            origin = Point(x: origin.x, y: ending.y)
            height = -height
        }
    }
    
    // check if other shape is within this one
    func contains(_ other:GameShape) -> Bool  {
        self.origin < other.origin &&
        other.ending < self.ending
    }
    
    // increase area of piece by area of other piece, keeping center unchanged
    mutating func consumes(_ other:GameShape) {
        let center = self.center
        let sizeRatio = width/height
        let newArea = self.area + other.area
        height = sqrt(newArea / sizeRatio)
        width = newArea/height
        self.center = center
    }
}
