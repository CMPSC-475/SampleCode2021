//
//  CardStack.swift
//  Gess
//
//  Created by Hannan, John Joseph on 11/7/21.
//

import SwiftUI

struct CardStack: View {
    @StateObject var manager = Manager()
    
    var body: some View {
        VStack {
        ZStack {
            ForEach($manager.cards) { $card in
                BaseballCardView(cardInfo: $card)
                    .stacked()
            }
            .padding(80)
        }
            HStack {
                Score(title: "Traded", count: manager.traded.count)
                Spacer()
                Button("Reset") {
                        manager.reset()
                }
                Spacer()
                Score(title: "Kept", count: manager.kept.count)
            }
            .padding()
        }
        .environmentObject(manager)
    }

}

struct Score : View {
    var title : String
    var count : Int
    var body : some View {
        VStack {
            Text(title)
            Text("\(count)")
        }
    }
}

struct CardStack_Previews: PreviewProvider {
    static var previews: some View {
        CardStack()
    }
}



extension View {
    func stacked() -> some View {
        let offsetRange = -10...10
        let angleRange = -5...5
        let offset : CGFloat = CGFloat(Int.random(in: offsetRange))
        let angle = Angle(degrees: Double(Int.random(in: angleRange)))
        return self
            .offset(CGSize(width: 0, height: offset ))
            .rotationEffect(angle)
    }
}
