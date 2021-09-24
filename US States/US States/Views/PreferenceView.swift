//
//  PreferenceView.swift
//  US States
//
//  Created by Hannan, John Joseph on 9/19/21.
//

import SwiftUI

struct PreferenceView: View {
    @EnvironmentObject var manager : StateManager
    @AppStorage(Storage.sectioning) var sectioning : Sectioning = .none
    @AppStorage(Storage.homeStateIndex) var homeStateIndex : Int?
    @Binding var showingPreferences : Bool
    
    /*
    @Environment(\.presentationMode) var presentationMode
    */
    
    var body: some View {
        NavigationView {
            Form {
                
                Section(header: Text("Choose Home State")) {
                    Picker("Choose Home State", selection: $homeStateIndex) {
                        Text("None").tag(nil as Int?)
                        ForEach(manager.stateModel.states.indices, id:\.self) {i in
                            Text(manager.stateModel.states[i].name).tag(i as Int?)
                        }
                    }
                }
                
                Section(header: Text("List Sections")) {
                    Picker("Choose Sectioning", selection: $sectioning) {
                        ForEach(Sectioning.allCases, id:\.self) {section in
                            Text(section.rawValue)
                        }
                    }
                }

            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {self.showingPreferences.toggle()}
                }
                //presentationMode.wrappedValue.dismiss()
            }
  
        }
        .navigationBarTitle("Preferences")
    }
}

struct PreferenceView_Previews: PreviewProvider {
    static var previews: some View {
        PreferenceView( showingPreferences: .constant(true))
            .environmentObject(StateManager())
    }
}
