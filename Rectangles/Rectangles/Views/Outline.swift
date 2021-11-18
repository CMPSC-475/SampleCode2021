//
//  Outlilne.swift
//  Rectangles
//
//  Created by jjh9 on 11/16/21.
//

import SwiftUI

struct Outline: View {
    var shape:GameShape
    @EnvironmentObject var manager : GameManager
    var body: some View {
        
        Rectangle()
            .strokeBorder(style: StrokeStyle(lineWidth: 2, dash: [5]))
            .frame(width: abs(shape.width), height: abs(shape.height))
            .position(x: shape.center.x, y: shape.center.y)


    }
}

struct Outline_Previews: PreviewProvider {
    static var previews: some View {
        Outline(shape:GameShape.standard)
    }
}
