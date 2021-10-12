//
//  PlayerView.swift
//  Footballers
//
//  Created by jjh9 on 10/11/21.
//

import SwiftUI

struct PlayerView: View {
    @Binding var player : Player
    //@Environment(\.editMode) var editMode
    @State var editMode : EditMode = .inactive

    
    var body: some View {
        VStack(spacing:30){
            Text(player.teamname)
            TextEditor(text: $player.info)
               
                .font(.title)
                .padding(0)
                .disabled(.inactive == self.editMode)
                .padding()
        }
        .navigationTitle(Text(player.fullname))
        .navigationBarBackButtonHidden(editMode.isEditing)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                EditButton()
            }
        }
        .environment(\.editMode, $editMode)
        
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView(player: .constant(Player.standard))
    }
}
