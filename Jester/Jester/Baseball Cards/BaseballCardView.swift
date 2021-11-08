//
//  BaseballCardView.swift
//  Gess
//
//  Created by Hannan, John Joseph on 11/7/21.
//

import SwiftUI

struct BaseballCardView: View {
    @EnvironmentObject var manager : Manager

    @Binding var cardInfo : CardInfo
    let ratio : CGFloat = 2.5/3.5
    let angleChangeFactor : CGFloat = 0.2
    let offScreen : CGFloat = 400
    let translationThreshold : CGFloat = 100
    @State private var offset: CGSize = .zero
    @State private var angle = Angle(degrees: 0)

    // offset of card based on status
    var computedOffset : CGSize {
        switch cardInfo.status {
        case .unDecided:
            return CGSize.zero
        case .kept:
            return CGSize(width: offScreen, height: 0)
        case .traded:
            return CGSize(width: -offScreen, height: 0)
        }
    }
    
    var body: some View {
        let drag = DragGesture()
            .onChanged {v in
            }
            .onEnded {v in
            }
                
        
        return Image("\(cardInfo.id)")
            .resizable()
            .aspectRatio(ratio, contentMode: .fit)
            .gesture(drag)

    }
}

struct BaseballCardView_Previews: PreviewProvider {
    static var previews: some View {
        BaseballCardView(cardInfo: .constant(CardInfo.standard))
    }
}
