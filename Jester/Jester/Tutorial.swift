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
    
    @State private var orangeLocation: CGPoint = CGPoint(x: 190, y: 50)
    @State private var blueLocation: CGPoint = CGPoint(x: 190, y: 50)

    @State private var dragOffset = CGSize.zero
    @GestureState private var magScale : CGFloat = 1.0
    
    enum MoveState : Equatable {
        case initial
        case moving(CGSize)
    }
    @GestureState private var moveState = MoveState.initial
    var moveScale : CGFloat {moveState == .initial ? 1.0 : 1.2}
    var moveOffset : CGSize {
        switch moveState {
        case .initial:
            return CGSize.zero
        case .moving(let t):
            return t
        }
        
    }
    @State private var offset : CGSize = CGSize.zero
    @State private var scale : CGFloat = 1.0
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
            .updating($magScale) { value, state, Transaction in
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
        
        let movePosition = DragGesture()
            .updating($moveState) { (value, state, _) in
                switch state {
                case .initial:
                    state = .moving(CGSize.zero)
                case .moving( _):
                    state = .moving(value.translation)
                }
            }
        
        let pressAndDragGesture = LongPressGesture(minimumDuration: 0.01).sequenced(before:DragGesture())
            .onChanged { (value) in
                switch value {
                case .first(_):
                    withAnimation {
                        scale = 1.2
                    }
                case .second(true, let drag):
                    self.blueLocation = drag?.location ?? self.blueLocation
                default:
                    break
                }
            }
            .onEnded { (value) in
                switch value {
                case .first(true):
                    break
                case .second(true, _):
                    withAnimation {scale = 1.0}
                default:
                    break
                }
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
                    .scaleEffect(magScale)
                    .gesture(magGesture)
                    //.gesture(rotateGesture)
                    //.gesture(magRotate)
                
                ColorSquare(color:.orange)
                    .scaleEffect(moveScale)
                    .position(orangeLocation)
                    .offset(moveOffset)
                    .gesture(movePosition)
                
                ColorSquare(color:.blue)
                    .draggable(location: $blueLocation)
//                    .scaleEffect(scale)
//                    .position(blueLocation)
//                    .offset(offset)
//                    .gesture(pressAndDragGesture)
                
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

struct ColorSquare : View {
    var color : Color
    var body : some View {
        RoundedRectangle(cornerRadius: 10)
            .foregroundColor(color)
            .frame(width: 100, height: 100)

    }
}

