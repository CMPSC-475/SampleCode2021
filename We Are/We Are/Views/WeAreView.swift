//
//  WeAreView.swift
//  We Are
//
//  Created by Hannan, John Joseph on 8/26/21.
//

import SwiftUI

struct WeAreView: View {
    @EnvironmentObject var cheerManager : CheerManager
    
    var body: some View {
        ZStack {
            background
            VStack {
                LionImage()
                CheerText(cheer: cheerManager.cheerState.cheer1, isVisible: cheerManager.cheer1Visible)
                
                CheerText(cheer: cheerManager.cheerState.cheer2, isVisible: cheerManager.cheer2Visible)
                Spacer()
                CheerButton(title: "Cheer")
            }
        }

    }
    
    let background : some View = Color.orange
        .ignoresSafeArea()
}




struct WeAreView_Previews: PreviewProvider {
    static var previews: some View {
        WeAreView()
            .environmentObject(CheerManager(cheering: PSUCheers()))
        
    }
}
