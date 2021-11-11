//
//  RootView.swift
//  Gestures
//
//  Created by Hannan, John Joseph on 11/8/21.
//

import SwiftUI

struct RootView: View {
    var body: some View {
        
        NavigationView {
            List {
                NavigationLink(destination: {Tutorial()}) {
                    Label("Tutorial", systemImage: "list.dash")
                }
                NavigationLink(destination: {Position()}) {
                    Label("Position", systemImage: "point.topleft.down.curvedto.point.bottomright.up")
                }
                NavigationLink(destination: {CardStack()}) {
                    Label("Cards", systemImage: "lanyardcard")
                }
                NavigationLink(destination: {CardFlip()}) {
                    Label("Flip", systemImage: "arrow.left.and.right.righttriangle.left.righttriangle.right")
                }
                NavigationLink(destination: {HamiltonCard()}) {
                    Label("Flip (Generic)", systemImage: "arrow.left.and.right.righttriangle.left.righttriangle.right")
                }
                NavigationLink(destination: {HitTest()}) {
                    Label("Hit Test", systemImage: "testtube.2")
                }
            }

            .navigationTitle("Gestures")
            
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
