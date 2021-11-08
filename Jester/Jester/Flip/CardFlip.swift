//
//  CardFlip.swift
//  Gestures
//
//  Created by jjh9 on 11/11/20.
//

import SwiftUI


struct CardFlip: View {
    @StateObject var manager = CardManager()
    let frontDegrees : Double = 0.0
    let backDegrees : Double = 180.0
    
    var body: some View {
        
        
        let swipe = DragGesture()
            .onChanged{ (value) in
              
            }
        
            .onEnded { (value) in

            }
        Image(manager.cardState.imageName)
            .resizable()
            .aspectRatio(1.0, contentMode: .fit)
            .padding()

            .gesture(swipe)
    }
    
}

struct CardFlip_Previews: PreviewProvider {
    static var previews: some View {
        CardFlip()
    }
}
