//
//  GameManager.swift
//  Rectangles
//
//  Created by Hannan, John Joseph on 11/12/21.
//

import SwiftUI

class GameManager : ObservableObject {
    
    @Published var shapes = [GameShape]()
    @Published var inProgressShape : GameShape?

    // Creating a new piece
    func newPiece(at point:CGPoint)  {
        inProgressShape = GameShape(origin: point.point, width: 0, height: 0)
    }
    
    func updatePiece(to point:CGPoint) {
        inProgressShape?.ending = point.point
    }
    
    func addPiece() {
        if let shape = inProgressShape {
            shapes.append(shape)
            inProgressShape = nil
        }
    }
    
}
