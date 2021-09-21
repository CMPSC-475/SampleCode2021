//
//  DetailView.swift
//  US States
//
//  Created by jjh9 on 9/11/20.
//  Copyright © 2020 jjh9. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    @Binding var state : USState
    
    var body: some View {
        List {
            Button(action: {state.favorite.toggle()}, label: {
                Image(systemName: "star")
                    .foregroundColor(.red)
            })
            FeatureView(title: "Visited", feature: $state.visited, symbol: Symbols.visitedSymbol, color: Symbols.visitedColor)
            FeatureView(title: "Favorite", feature: $state.favorite, symbol: Symbols.favoriteSymbol, color: Symbols.favoriteColor)
            
            Image(state.name)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text(state.info)
        }
        .navigationTitle(state.name)
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct DetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        DetailView(state: .constant(USState.standard))
        
    }
}


