//
//  Outlilne.swift
//  Rectangles
//
//  Created by jjh9 on 11/16/21.
//

import SwiftUI

struct Outlilne: View {
    var shape:GameShape
    @EnvironmentObject var manager : GameManager
    var body: some View {
        
        Rectangle()
            .strokeBorder(style: StrokeStyle(lineWidth: 2, dash: [5]))
            .position(x: shape.origin.x, y: shape.origin.y)
            .frame(width: shape.width, height: shape.height)
        
    }
}

struct Outlilne_Previews: PreviewProvider {
    static var previews: some View {
        Outlilne(shape:GameShape.standard)
    }
}
