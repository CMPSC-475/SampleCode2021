//
//  BackgroundView.swift
//  Rectangles
//
//  Created by Hannan, John Joseph on 11/12/21.
//

import SwiftUI

enum DragState : Equatable {
    case inactive
    case dragging
}
struct BackgroundView: View {
    @EnvironmentObject var manager : GameManager
    
    var body: some View {
        ZStack {
            
            let dragGesture = DragGesture()
                .onChanged { value in
                    if manager.inProgressShape == nil {
                        manager.newPiece(at: value.location)
                    } else {
                        manager.updatePiece(to: value.location)
                    }
                }
                .onEnded { value in
                    manager.addPiece()
                }
            
            Color.gray
                .gesture(dragGesture)
            
            BottomBar()
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
