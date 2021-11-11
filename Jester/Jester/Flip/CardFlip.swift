//
//  CardFlip.swift
//  Gestures
//
//  Created by jjh9 on 11/11/20.
//

import SwiftUI


struct CardFlip: View {
    enum DraggingState {
        case right, left
    }
    
    @State private var degrees  : Double = 0.0  // rotation angle
    @State private var swiping  = DraggingState.left //swipe direction

    
    var frontImageName = "Hamilton Front"
    var backImageName = "Hamilton Back"
    var imageName : String {isShowingBack ? backImageName : frontImageName}
    
    let frontDegrees : Double = 0.0
    let backDegrees : Double = -180.0
    let midDegrees : Double = -90.0

    var flipDegrees : Double {isShowingBack ? backDegrees : frontDegrees}
    var isShowingBack : Bool {degrees < midDegrees}
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
                if isShowingBack {
                    withAnimation { degrees = backDegrees}
                    swiping = .right
                } else {
                    withAnimation { degrees = frontDegrees}
                    swiping = .left
                }
            }
        FlipImage(name: imageName)
            .rotation3DEffect(Angle(degrees:flipDegrees), axis: (0,1,0))
        .rotation3DEffect(Angle(degrees:degrees), axis: (0,1,0))
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

struct CardFlip_Previews: PreviewProvider {
    static var previews: some View {
        CardFlip()
    }
}
