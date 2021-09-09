//
//  ContentView.swift
//  Memory
//
//  Created by jjh9 on 8/30/20.
//  Copyright © 2020 jjh9. All rights reserved.
//

import SwiftUI
import Combine

struct MemoryView: View {
    @EnvironmentObject var memoryManager : MemoryManager
    @State private var showPreferences = false
    var body: some View {
        
        ZStack {
            Rectangle()
                .fill(memoryManager.background)
                .ignoresSafeArea()
            VStack {
                HStack {
                    GuessButtonView( index:0)
                    GuessButtonView(index:1)
                }
                HStack {
                    GuessButtonView(index:2)
                    GuessButtonView(index:3)
                }
                Spacer(minLength: 50)
                SequenceView()
                MainButtonView()
                
                HStack {
                    Spacer()
                    PreferenceButtonView(showPreferences: $showPreferences)
                }
                
                
            }
            .padding()
            .environmentObject(memoryManager)
            .sheet(isPresented: $showPreferences, content: {
                PreferencesView(preferences: $memoryManager.memoryModel.preferences, showPreferences: $showPreferences)
            })
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MemoryView()
            .environmentObject(MemoryManager())
    }
}


