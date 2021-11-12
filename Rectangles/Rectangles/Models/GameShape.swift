//
//  GameShape.swift
//  Rectangles
//
//  Created by Hannan, John Joseph on 11/12/21.
//

import Foundation
import CoreGraphics

struct GameShape {
    var rect : CGRect
    let colorRGB  = (Double.random(in: 0...1), Double.random(in: 0...1), Double.random(in: 0...1))
    var zIndex : Int = 0
    
    // use for previews
    static var anyRect = GameShape(rect: CGRect(x: 100, y: 100, width: 100, height: 100))
    
}

// Convenience Computed Properties
extension GameShape {
    var center : CGPoint {
        get {return rect.center}
        set(newValue) {
            rect.center = newValue
        }
    }
    var width : CGFloat {abs(rect.size.width)}
    var height : CGFloat {abs(rect.size.height)}

    
    var area : CGFloat {
            return width * height
    }
}

// functions
extension GameShape {
    // check if other shape is within this one
    func contains(_ other:GameShape) -> Bool  {
        return self.rect.contains(other.rect)
    }
    
    // increase area of piece by area of other piece
    mutating func consumes(_ other:GameShape) {

        let sizeRatio = width/height
        let newArea = width*height + other.area
        let newWidth = sqrt(newArea * sizeRatio)
        let newHeight = newArea/newWidth

        let currentCenter = self.center
        self.rect.size = CGSize(width: newWidth, height: newHeight)
        self.center = currentCenter // to trigger setting new origin
 
    }
}
