//
//  AddPlayerView.swift
//  Footballers
//
//  Created by jjh9 on 10/11/21.
//

import SwiftUI

struct AddPlayerView: View {
    @EnvironmentObject var manager : PlayersManager
    @Environment(\.dismiss) var dismiss
    
    @State private var firstname : String = ""
    @State private var lastname : String = ""
    @State private var teamname : String = ""
    @State private var country : String = ""
    var body: some View {
        NavigationView {
            Form{
                Section(header: Text("Enter Player Details")) {
                TextField("First Name", text: $firstname)
                TextField("Last Name", text: $lastname)
                    Picker("Team", selection: $teamname) {
                        ForEach(manager.teams.map{$0.name}, id:\.self) {name in
                            Text(name)
                        }
                    }
                //TextField("Team Name", text: $teamname)
                TextField("Country", text: $country)
                }

            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {dismiss()}
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add") {
                        let player = Player(firstname: firstname, lastname: lastname, team: teamname, country: country)
                        self.manager.addPlayer(player: player)
                        dismiss()}
                        .disabled(!isValid)
                }
            }
        }
    }
    
    private var isValid : Bool {[firstname,lastname,teamname,country].allSatisfy{!$0.isEmpty}}
}

struct AddPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        AddPlayerView()
    }
}
