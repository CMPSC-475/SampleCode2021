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
                offset = v.translation
                angle = Angle(degrees: v.translation.width * angleChangeFactor)
            }
            .onEnded {v in
               dragEnded(with: v)
            }
                
        
        return Image("\(cardInfo.id)")
            .resizable()
            .aspectRatio(ratio, contentMode: .fit)
            .offset(offset)
            .rotationEffect(angle)
            .gesture(drag)
            .onChange(of: cardInfo.status) { newValue in
                offset = computedOffset
                if newValue == .unDecided {
                    angle = Angle.zero
                }
            }
            .animation(.easeInOut(duration: 2.0), value:offset)
            .animation(.easeInOut(duration: 2.0), value:angle)

    }
    
    func dragEnded(with v:DragGesture.Value) {
        if v.translation.width < -translationThreshold {
            cardInfo.status = .traded
            manager.tradedCard(card: cardInfo)
        } else if v.translation.width  > translationThreshold {
            cardInfo.status = .kept
            manager.keptCard(card: cardInfo)
        } else {
            offset = CGSize.zero
            angle = .zero
        }
    }
}

struct BaseballCardView_Previews: PreviewProvider {
    static var previews: some View {
        BaseballCardView(cardInfo: .constant(CardInfo.standard))
    }
}
