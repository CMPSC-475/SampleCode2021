//
//  Gestures.swift
//  Gestures
//
//  Created by jjh9 on 11/9/20.
//

import SwiftUI

struct Tutorial: View {
    @State private var tapCount = 0
    @State private var pressCount = 0
    @State private var doubleCount = 0
    @State private var rotationAngle : Angle = Angle.zero
    @State private var scaleFactor : CGFloat = 1.0
    
    @State private var location: CGPoint = CGPoint(x: 190, y: 50)
    @State private var dragOffset = CGSize.zero
    @GestureState private var scale : CGFloat = 1.0
    
    var body: some View {
       
        let tapGesture = TapGesture()
            .onEnded { () in
                tapCount += 1
            }
        
        let doubleTapGesture = TapGesture(count: 2)
            .onEnded { () in
                doubleCount += 1
            }
        let longPress = LongPressGesture()
            .onChanged { value in
                 print("Changed:", value)
            }
            .onEnded { Value in
                print("Ended")
            }
        
        let magGesture = MagnificationGesture()
            .updating($scale) { value, state, Transaction in
                state = value
            }
//            .onChanged { value in
//                scaleFactor = value
//            }
//            .onEnded { _location in
//                scaleFactor = 1.0
//            }
        let rotateGesture = RotationGesture()
            .onChanged { angle in
                rotationAngle = angle
            }
        
        let magRotate = magGesture.simultaneously(with: rotateGesture)
        
        let dragGesture = DragGesture()
            .onChanged { value in
                dragOffset = value.translation
            }
        
        return ScrollView {
            VStack(spacing:30) {
                Text("Taps: \(tapCount)")
                    .onTapGesture {
                        tapCount += 1
                    }
                    //.gesture(tapGesture)
                
                Text("Double: \(doubleCount)")
                    .gesture(doubleTapGesture)
                
                Text("Presses: \(pressCount)")
                    .gesture(tapGesture)

                    .gesture(longPress)
//                    .onLongPressGesture {
//                        pressCount += 1
//                    }
                
                
                SealView()
                    .rotationEffect(rotationAngle)
                    .scaleEffect(scale)
                    .gesture(magGesture)
                    //.gesture(rotateGesture)
                    //.gesture(magRotate)
                
                OrangeSquare()
                    .position(location)
                    .offset(dragOffset)
                    .gesture(dragGesture)
                
                Text("Bottom Text")
            }
        }
        .font(.title3)
    }
}

struct Gestures_Previews: PreviewProvider {
    static var previews: some View {
        Tutorial()
    }
}

struct SealView : View {
    var body : some View {
        Image("Penn Seal")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width:100)
    }
}

struct OrangeSquare : View {
    var body : some View {
        RoundedRectangle(cornerRadius: 10)
            .foregroundColor(.orange)
            .frame(width: 100, height: 100)

    }
}
