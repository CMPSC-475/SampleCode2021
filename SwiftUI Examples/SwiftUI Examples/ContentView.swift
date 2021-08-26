//
//  ContentView.swift
//  SwiftUI Examples
//
//  Created by jjh9 on 8/24/21.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        VStack {
            HStack {
                Circle()
                Circle()
            }
            Button(action: {}) {
                Text("Push Me")
            }
            ZStack {
                Image("Mascot")
                //RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                Text("Nittany Lion")
            }
            Rectangle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
