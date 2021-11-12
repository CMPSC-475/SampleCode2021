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
        func toggle() -> DraggingState {
            self == .left ? .right : .left
        }
    }
    
    @State private var degrees  : Double = 0.0  // rotation angle
    @State private var swiping  = DraggingState.left //swipe direction

    
    var frontImageName = "Hamilton Front"
    var backImageName = "Hamilton Back"

    
    let frontDegrees : Double = 0.0
    let backDegrees : Double = -180.0
    let midDegrees : Double = -90.0

    var isShowingBack : Bool {degrees < midDegrees}
    var imageName : String {isShowingBack ? backImageName : frontImageName}
    var flipDegrees : Double {isShowingBack ? backDegrees : frontDegrees}
    var swipingTranslation : Double {swiping == .right ? backDegrees : frontDegrees}
    
    var body: some View {
        
        let swipe = DragGesture()
            .onChanged { value in
                let translation = Double(value.translation.width)
                degrees = rotationDegreesFor(swipingTranslation + translation)
//                switch swiping {
//                case .right:
//                    degrees = rotationDegreesFor(backDegrees + translation)
//                case .left:
//                    degrees = rotationDegreesFor(translation)
//                }
            }
            .onEnded { value  in
                withAnimation { degrees = flipDegrees}
                swiping = isShowingBack ? .right : .left
//                if isShowingBack {
//                    withAnimation { degrees = backDegrees}
//                    swiping = .right
//                } else {
//                    withAnimation { degrees = frontDegrees}
//                    swiping = .left
//                }
            }
        FlipImage(name: imageName)
            //.rotation3DEffect(Angle(degrees:flipDegrees), axis: (0,1,0))
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

struct CardFlip_Previews: PreviewProvider {
    static var previews: some View {
        CardFlip()
    }
}
