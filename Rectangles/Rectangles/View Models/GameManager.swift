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

    
    // for bringing views to the top of ZStack
    var currentZIndex : Double = 0
    func nextZIndex() -> Double {
        currentZIndex += 1
        return currentZIndex
    }
     
    
    // Creating a new piece
    func newPiece(at point:CGPoint)  {
        inProgressShape = GameShape(origin: point.point, zIndex: nextZIndex())
        
    }
    
    func updatePiece(to point:CGPoint) {
        inProgressShape?.ending = point.point
    }
    
    func addPiece() {
        if var shape = inProgressShape {
            shape.standardized()
            shapes.append(shape)
            inProgressShape = nil
        }
    }
    
    // check if piece is completely contained inside another piece.  If so, remove it and increase the area of the containing piece by the area of this piece
    func removeIfEaten(_ piece:GameShape)  {
        if let largerPieceIndex = shapes.firstIndex(where: {
            $0.contains(piece)
        }) {
            shapes[largerPieceIndex].consumes(piece)
            if let index = shapes.firstIndex(of: piece) {
                
                shapes.remove(at: index)
            }
        }
    }
    
    func removeAll() {
        shapes.removeAll()
    }
    
}
