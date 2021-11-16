//
//  RectangleView.swift
//  Rectangles
//
//  Created by jjh9 on 11/16/21.
//

import SwiftUI

struct RectangleView: View {
    @EnvironmentObject var manager : GameManager
    var shape : GameShape
    var body: some View {
        Rectangle()
            .position(x: shape.origin.x, y: shape.origin.y)
            .frame(width: shape.width, height: shape.height)
            .foregroundColor(colorFromRGB(shape: shape))
    }
    
    func colorFromRGB(shape:GameShape) -> Color {
        let (red,green,blue) = shape.colorRGB
        return Color(red: red, green: green, blue: blue)
        
    }
}

struct RectangleView_Previews: PreviewProvider {
    static var previews: some View {
        RectangleView(shape:GameShape.standard)
    }
}
