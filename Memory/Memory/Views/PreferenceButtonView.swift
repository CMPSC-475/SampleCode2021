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
    
    var body: some View {
        //TODO: Implement a button to present preferences
        Text("Button")
    }
}

struct PreferenceButtonViewe_Previews: PreviewProvider {
    static var previews: some View {
        PreferenceButtonView().environmentObject(MemoryManager())
    }
}
