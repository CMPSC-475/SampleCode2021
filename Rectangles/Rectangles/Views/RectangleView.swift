//
//  RectangleView.swift
//  Rectangles
//
//  Created by jjh9 on 11/16/21.
//

import SwiftUI

struct RectangleView: View {
    @EnvironmentObject var manager : GameManager
    @Binding var shape : GameShape
    @State var offset = CGSize.zero
    var color : Color {Color(red: shape.colorRGB.0, green: shape.colorRGB.1, blue: shape.colorRGB.2)}
    
    var body: some View {
        
        let longPress = LongPressGesture(minimumDuration: 0.01)
            .onChanged { v in
                shape.zIndex = manager.nextZIndex()
            }
        let dragGesture = DragGesture()
            .onChanged { value in
              
                offset = value.translation
            }
            .onEnded { value in
                shape.center.offsetBy(width: offset.width, height: offset.height)
                offset = CGSize.zero
                withAnimation {
                  manager.removeIfEaten(shape)
                }
            }
        let moveGesture = SimultaneousGesture(longPress, dragGesture)
        Rectangle()
            .foregroundColor(color)
    
            .frame(width: shape.width, height: shape.height)
            .position(x: shape.center.x, y: shape.center.y)
            .offset(offset)
            .gesture(moveGesture)
            .zIndex(shape.zIndex)
    }
    
    func colorFromRGB(shape:GameShape) -> Color {
        let (red,green,blue) = shape.colorRGB
        return Color(red: red, green: green, blue: blue)
    }
}

//struct RectangleView_Previews: PreviewProvider {
//    static var previews: some View {
//        RectangleView(shape:GameShape.standard)
//    }
//}
