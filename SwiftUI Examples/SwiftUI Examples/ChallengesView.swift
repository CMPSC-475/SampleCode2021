//
//  ChallengesView.swift
//  SwiftUI Examples
//
//  Created by Hannan, John Joseph on 8/27/21.
//

import SwiftUI

struct ChallengesView: View {
    var body: some View {
        //ImageCaption()
        //RedSquaresView()
        NumbersView()
        //ConcentricCirclesView()
    }
}

struct ImageCaption: View {
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
        Image("Mascot")
            Text("Nittany Lion")
        }
    }
}

struct NumbersView: View {
    var body: some View {
        HStack {
            Spacer()
            VStack(alignment:.trailing) {
                ForEach(0..<100) {i in
                        Text("\(i)")
                    }
            }.padding()
            
        }
        
    }
}

struct ConcentricCirclesView: View {
    var body: some View {
        
        ZStack {
            ForEach(0..<10) {i in
                Circle()
                    .fill(i%2 == 0 ? Color.pink : Color.green)
                    .scaleEffect(CGFloat(1.0 - CGFloat(i)*0.05))
            }
        }
    }
}

struct ChallengesView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengesView()
    }
}
