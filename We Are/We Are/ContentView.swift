//
//  ContentView.swift
//  We Are
//
//  Created by jjh9 on 8/26/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.orange
            VStack {
                Image("Mascot")
                    .padding()
                CheerText(cheer: "We Are", isVisible: true)
                CheerText(cheer: "Penn State", isVisible: true)
                Spacer()
                CheerButton(title: "Cheer")
            }
        }
    }
}

struct CheerButton: View {
    var title: String
    var body : some View {
        Button(title) {/* action */ }
            .padding()
        
    }
}

struct CheerText : View {
    var cheer: String
    var isVisible : Bool
    var body : some View {
        Text(cheer)
            .opacity(isVisible ? 1 : 0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
