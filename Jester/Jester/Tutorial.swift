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
    
    var body: some View {
        
        
        return ScrollView {
            VStack(spacing:30) {
                Text("Taps: \(tapCount)")
                
                Text("Double: \(doubleCount)")
                
                Text("Presses: \(pressCount)")
                
                Image("Penn Seal")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:100)
                
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.orange)
                    .frame(width: 100, height: 100)
                    .position(location)
                
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
