//
//  DetailView.swift
//  US States
//
//  Created by jjh9 on 9/11/20.
//  Copyright © 2020 jjh9. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var manager: StateManager
    
    var body: some View {
            List {
            //TODO: add year founded, description, images, favorite button
            }

    }
}

struct DetailView_Previews: PreviewProvider {

    static var previews: some View {
        DetailView()
            .environmentObject(StateManager())
    }
}

