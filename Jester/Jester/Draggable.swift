//
//  Draggable.swift
//  Jester
//
//  Created by jjh9 on 11/11/21.
//

import Foundation
import SwiftUI

struct Draggable : ViewModifier {
    @Binding var location : CGPoint
    @State private var scale : CGFloat = 1.0

    func body(content:Content) -> some View {
        let pressAndDragGesture = LongPressGesture(minimumDuration: 0.01).sequenced(before:DragGesture())
            .onChanged { (value) in
                switch value {
                case .first(_):
                    withAnimation {
                        scale = 1.2
                    }
                case .second(true, let drag):
                    self.location = drag?.location ?? self.location
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
        
        return content
            .scaleEffect(scale)
            .position(location)
            .gesture(pressAndDragGesture)
    }
}

extension View {
    func draggable(location : Binding<CGPoint>) -> some View {
        return self.modifier(Draggable(location: location))
    }
}
