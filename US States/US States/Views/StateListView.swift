//
//  StateListView.swift
//  US States
//
//  Created by jjh9 on 9/14/21.
//

import SwiftUI

struct StateListView: View {
    @EnvironmentObject var manager : StateManager
    @AppStorage("sectioning") var sectioning : Sectioning = .none
    
    var sectionInfos : [SectionInfo] { manager.sectionInfo(for: sectioning)}
    
    var body: some View {
        List {
            if  sectioning == .none {
                SectionView(indices: manager.allIndicies) 
            } else {
                ForEach(sectionInfos) { sectionInfo in
                    Section(header: CustomHeader(text: sectionInfo.title)) {
                        SectionView(indices: sectionInfo.indicies)
                    }
                }
            }
        }
        
    }
}

struct StateListView_Previews: PreviewProvider {
    static var previews: some View {
        StateListView()
            .environmentObject(StateManager())
    }
}
