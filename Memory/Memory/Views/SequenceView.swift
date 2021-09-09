//
//  SequenceView.swift
//  Memory
//
//  Created by jjh9 on 9/1/20.
//  Copyright © 2020 jjh9. All rights reserved.
//

import SwiftUI

// The sequence of dots that the user is trying to guess[
struct SequenceView: View {
    @EnvironmentObject var memoryManager : MemoryManager
    
    let width :CGFloat = 30.0
    let labelFontSize : CGFloat = 25.0
    var body: some View {
        VStack {
            HStack{
                ForEach(memoryManager.gameSequence.indices, id:\.self) { i in
                    let gamePiece = memoryManager.gameSequence[i]
                    GamePieceView(gamePiece: gamePiece, fontSize: labelFontSize)
        
                        .frame(width: self.width, height: self.width, alignment: .center)
                        .opacity(i < memoryManager.visibleSequenceCount ? 1 : 0)
                        //TODO: scale up current one
                    
                }
            }
            Text("Memorize This Sequence")
                .font(.title3)
                .opacity(memoryManager.shouldDisplayMemorizeText ? 1.0 : 0.0)        }
    }
}

struct SequenceView_Previews: PreviewProvider {
    static var previews: some View {
        SequenceView()
            .environmentObject(MemoryManager()) 
    }
}
