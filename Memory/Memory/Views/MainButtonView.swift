//
//  MainButtonView.swift
//  Memory
//
//  Created by jjh9 on 9/1/20.
//  Copyright © 2020 jjh9. All rights reserved.
//

import SwiftUI

struct MainButtonView: View {
    @EnvironmentObject var memoryViewModel : MemoryManager
    let buttonTextSize :CGFloat = 40
    let circleScaleFactor :CGFloat = 0.65
    
    var body : some View {
        //TODO: add button action
        Button(action: {memoryViewModel.advanceGameState()}) {
            ZStack {
                Circle()
                    .scale(circleScaleFactor)
                    .fill(Color.black)
                Text(memoryViewModel.mainButtonTitle).font(.system(size: self.buttonTextSize))
                    .foregroundColor(.white)
            }
        }
        .disabled(memoryViewModel.shouldDisablePlayButton)
    }
}

struct PlayButtonView_Previews: PreviewProvider {
    static var previews: some View {
        MainButtonView()
            .environmentObject(MemoryManager()) 
    }
}
