//
//  CG+Convenience.swift
//  Rectangles
//
//  Created by Hannan, John Joseph on 11/8/21.
//

import Foundation
import CoreGraphics

//conversion between CGPoint and Point
extension CGPoint {
    var point : Point {Point(x: self.x, y: self.y)}
    init(_ p:Point) {
        self.init()
        self.x = p.x
        self.y = p.y
    }
}
