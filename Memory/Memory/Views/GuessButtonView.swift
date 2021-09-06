//
//  GuessButtonView.swift
//  Memory
//
//  Created by jjh9 on 9/1/20.
//  Copyright © 2020 jjh9. All rights reserved.
//

import SwiftUI

struct GuessButtonView : View {
    @EnvironmentObject var memoryViewModel : MemoryManager
    let index : Int  //specifies which button
    let labelFontSize : CGFloat = 100
    
    var body: some View {
        let gamePiece = GamePiece(background: .red, title: "A")
        //TODO: get game piece from view Model
        
        return Button(action: {/* action */}) {
            GamePieceView(gamePiece: gamePiece, fontSize: labelFontSize)
        }
    }
    

}

struct ColorButtonView_Previews: PreviewProvider {
    static var previews: some View {
        GuessButtonView(index: 0)
            .environmentObject(MemoryManager())
    }
}


