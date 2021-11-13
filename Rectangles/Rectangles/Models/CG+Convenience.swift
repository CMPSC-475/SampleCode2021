//
//  CG+Convenience.swift
//  Rectangles
//
//  Created by Hannan, John Joseph on 11/8/21.
//

import Foundation
import CoreGraphics

extension CGPoint {
    var point : Point {Point(x: self.x, y: self.y)}
    init(p:Point) {
        self.init()
        self.x = p.x
        self.y = p.y
    }
}
