//
//  CG+Convenience.swift
//  Gestures
//
//  Created by jjh9 on 11/18/20.
//

import Foundation
import CoreGraphics

extension CGFloat {
    var sqr : CGFloat {self * self}
}

extension CGPoint {
    func distanceFrom(_ a: CGPoint) -> CGFloat {
        let xDist = a.x - self.x
        let yDist = a.y - self.y
        return CGFloat(sqrt(xDist.sqr + yDist.sqr))
    }
    
    func offsetBy(_ size:CGSize) -> CGPoint {
        return CGPoint(x: x + (size.width), y: y + (size.height))
    }
    
    static func -(lhs:CGPoint, rhs:CGPoint) -> CGSize {
        return CGSize(width: (lhs.x-rhs.x), height: (lhs.y-rhs.y))
    }
    
    static func +(lhs:CGPoint, rhs:CGPoint) -> CGPoint {
        return CGPoint(x: (lhs.x+rhs.x),
                       y: (lhs.y+rhs.y))
    }
    
}

extension CGRect {
    var center: CGPoint {
        get { return CGPoint(x: centerX, y: centerY) }
        set(newValue) { centerX = newValue.x; centerY = newValue.y }
        }
    var centerX: CGFloat {
        get { return midX }
        set(newValue) { origin.x = newValue - width / 2.0 }
        }
    var centerY: CGFloat {
        get { return midY }
        set(newValue) { origin.y = newValue - height / 2.0 }
        }
    
    mutating func expandBy(size:CGSize) {
        let sizeRatio = width/height
        let newArea = width*height + size.width*size.height
        let newWidth = sqrt(newArea * sizeRatio)
        let newHeight = newArea/newWidth

        let currentCenter = self.center
        self.size = CGSize(width: newWidth, height: newHeight)
        self.center = currentCenter
    }
}
