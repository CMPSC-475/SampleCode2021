//
//  GameView.swift
//  Rectangles
//
//  Created by Hannan, John Joseph on 11/12/21.
//

import SwiftUI

struct GameView: View {
    @EnvironmentObject var manager : GameManager
    var body: some View {
        
        BackgroundView()
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
