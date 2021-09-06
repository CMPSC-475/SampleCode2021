//
//  GamePieceView.swift
//  Memory
//
//  Created by jjh9 on 9/10/20.
//  Copyright © 2020 jjh9. All rights reserved.
//

import SwiftUI


struct GamePieceView : View {
    var gamePiece: GamePiece
    var fontSize: CGFloat

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: ViewConstants.buttonCornerRadius)
                .fill(gamePiece.background)
                .aspectRatio(1.0, contentMode: .fit)
                .shadow(radius: ViewConstants.shadowRadius)
               
            Text(gamePiece.title)
                .foregroundColor(.black)
                .font(.system(size: fontSize))
        }
    }
}

struct GamePieceView_Previews: PreviewProvider {
    static let gamePiece = GamePiece(background: .yellow, title: "X")
    static var previews: some View {
        GamePieceView(gamePiece: gamePiece, fontSize: 40)
            .environmentObject(MemoryManager())
    }
}
