//
//  Flippable.swift
//  Jester
//
//  Created by Hannan, John Joseph on 11/11/21.
//

import SwiftUI

struct Flippable<Content>: View where Content: View {
    
    var frontContent : () -> Content
    var backContent : () -> Content
    var content : Content {isShowingBack ? backContent() : frontContent()}
    
    enum DraggingState {
        case right, left
    }
    
    @State private var degrees  : Double = 0.0  // rotation angle
    @State private var swiping  = DraggingState.left //swipe direction
    
    let frontDegrees : Double = 0.0
    let backDegrees : Double = -180.0
    let midDegrees : Double = -90.0
    
    var isShowingBack : Bool {degrees < midDegrees}
    var flipDegrees : Double {(isShowingBack ? backDegrees : frontDegrees)}
    
    var body: some View {
        let swipe = DragGesture()
            .onChanged { value in
                let translation = Double(value.translation.width)
                switch swiping {
                case .right:
                    degrees = rotationDegreesFor(backDegrees + translation)
                case .left:
                    degrees = rotationDegreesFor(translation)
                }
            }
            .onEnded { value  in
                withAnimation { degrees = flipDegrees}
                swiping = isShowingBack ? .right : .left
            }
        content
        .rotation3DEffect(Angle(degrees:(degrees + flipDegrees)), axis: (0,1,0))
        .gesture(swipe)
    }
    
    
    // Rotation should be between 0 and -180
      func rotationDegreesFor(_ translation: Double) -> Double {
          if translation > frontDegrees {
              return  frontDegrees
          } else if translation < backDegrees {
              return  backDegrees
          } else {
              return translation
          }
      }
}
