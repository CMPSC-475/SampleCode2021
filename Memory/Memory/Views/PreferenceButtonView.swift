//
//  PreferenceButtonViewe.swift
//  Memory
//
//  Created by jjh9 on 9/6/20.
//  Copyright © 2020 jjh9. All rights reserved.
//

import SwiftUI

struct PreferenceButtonView : View {
    @EnvironmentObject var memoryViewModel : MemoryManager
    @Binding var showPreferences : Bool
    
    let size : CGFloat = 25
    var body: some View {
        //TODO: Implement a button to present preferences
        Button(action: {showPreferences.toggle()}) {
            Image(systemName: "gear")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:size)
                .foregroundColor(.black)
                .padding()
        }
    }
}

struct PreferenceButtonViewe_Previews: PreviewProvider {
    static var previews: some View {
        PreferenceButtonView( showPreferences: .constant(true)).environmentObject(MemoryManager())
    }
}
