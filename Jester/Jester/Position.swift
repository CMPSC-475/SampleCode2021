//
//  Position.swift
//  Gestures
//
//  Created by jjh9 on 11/10/20.
//

import SwiftUI

struct Position: View {
    var o : Double = -50
    var p : Double = 50
    
    var body: some View {
        VStack(spacing:3) {
            
            Text("First")
                .position(x: 2*p, y: 2*p)
                .background(Color.red)
            
            Text("Second")
                .offset(x:o, y:o)
                .background(Color.blue)
            
            Text("Third")
                .background(Color.green)
                .position(x: p, y: p)
            
            Text("Fourth")
                .background(Color.gray)
                .offset(x:o, y:o)
        }
    }
}

struct Position_Previews: PreviewProvider {
    static var previews: some View {
        Position()
    }
}
