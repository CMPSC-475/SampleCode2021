//
//  TwisterView.swift
//  SwiftUI Examples
//
//  Created by Hannan, John Joseph on 8/25/21.
//

import SwiftUI

struct TwisterView: View {
    
    let rows = 18
    let columns = 10

    var body: some View {
        ScrollView([.horizontal, .vertical]) {
            VStack {
                ForEach(0..<rows) {i in
                    ShapeRow(columns: columns, offset: i)
                }
            }
        }
    }
}

struct TwisterView_Previews: PreviewProvider {
    static var previews: some View {
        TwisterView()
    }
}

/**
 A Row of colorful squares and circles
 */
struct ShapeRow: View {
    let colors : [Color] = [.red, .blue, .green, .orange, .yellow, .pink, .purple]
    let columns : Int
    let offset : Int  // used for determinining starting color for the row
    var body: some View {
        HStack {
            ForEach(0..<columns) {i in
                if (i) % 2 == 0 && offset % 2 == 0{
                    SquareView(color: colors[(i+offset)%colors.count])
                } else {
                    CircleView(color: colors[(i+offset)%colors.count])
                }
            }
        }
    }
}

struct SquareView: View {
    //let size : CGFloat = 75
    var color: Color
    var body: some View {
        Rectangle()
            .customDesign(color: color)
    }
}

struct CircleView: View {
    //let size : CGFloat = 75
    var color: Color
    var body: some View {
        Circle()
            .customDesign(color: color)
    }
}


// Example custom View Modifier
struct CustomDesign : ViewModifier {
    var color : Color
    let size : CGFloat = 75
    func body(content:Content) -> some View {
        return content
            .foregroundColor(color)
            .frame(width: size, height: size, alignment: .center)
    }
}

extension View {
    func customDesign(color:Color) -> some View {
        return self.modifier(CustomDesign(color: color))
    }
}
