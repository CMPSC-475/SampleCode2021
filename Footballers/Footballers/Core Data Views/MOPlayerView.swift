//
//  MOPlayerView.swift
//  Footballers
//
//  Created by jjh9 on 10/19/21.
//

import SwiftUI

struct MOPlayerView: View {
    @ObservedObject var player : PlayerMO
    @State var editMode : EditMode = .inactive

    
    var body: some View {
        VStack(spacing:30){
            Text(player.team.name)
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

//struct MOPlayerView_Previews: PreviewProvider {
//    static var previews: some View {
//        MOPlayerView()
//    }
//}
