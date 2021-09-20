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
            HStack {
                Text("Visited")
                Spacer()
                Button(action: {state.visited.toggle()}, label: {
                    Image(systemName: state.visited ? "car.circle.fill" : "car.circle")
                        .foregroundColor(Color.yellow)
                })
            }
            .padding()
            
            HStack {
                Text("Favorite")
                Spacer()
                Button(action: {state.favorite.toggle()}, label: {
                    Image(systemName: state.favorite ? "star.fill" : "star")
                        .foregroundColor(Color.green)
                })
            }
            .padding()
            
            
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


