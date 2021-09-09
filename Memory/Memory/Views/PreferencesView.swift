//
//  PreferencesView.swift
//  Memory
//
//  Created by jjh9 on 9/9/21.
//

import SwiftUI

struct PreferencesView: View {
    @Binding var preferences : Preferences
    @Binding var showPreferences : Bool
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Length of Sequence")) {
                    Stepper(value: $preferences.sequenceLength, in: GameConstants.sequenceRange) {
                        Text("\(preferences.sequenceLength)")
                    }
                }
                
                Section(header: Text("Choose Theme")) {
                    Picker("Theme", selection: $preferences.themeIndex) {
                        ForEach(Themes.themes.indices, id:\.self) { (index) in
                            (GamePieceView(gamePiece: Themes.themes[index][0], fontSize: 25.0))
                        }
                        .frame(width: 30, height: 30, alignment: .center)
                    }
                }
                
                Section() {
                    HStack {
                        Spacer()
                        
                        Button(action: {showPreferences.toggle()}, label: {
                            Text("Dismiss")
                        })
                        Spacer()
                    }
                }
            }
        }
    }
}

struct PreferencesView_Previews: PreviewProvider {
    static var previews: some View {
        PreferencesView(preferences: .constant(Preferences.standard), showPreferences: .constant(true))
    }
}
