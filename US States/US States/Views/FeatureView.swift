//
//  FeatureView.swift
//  US States
//
//  Created by Hannan, John Joseph on 9/19/21.
//

import SwiftUI

struct FeatureView: View {
    var title : String
    @Binding var feature : Bool
    var symbol : String
    var color : Color
    var body: some View {

        
        HStack {
            Text(title)
            Spacer()
            Button(action: {feature.toggle()}, label: {
                Image(systemName: feature ? "\(symbol).fill" : symbol)
                    .foregroundColor(color)
            })
        }

//        Button(action: {feature.toggle()}) {
//            Label(title, systemImage: feature ? "\(symbol).fill" : symbol)
//            }
        
        .padding()
    }
}

struct FeatureView_Previews: PreviewProvider {
    static var previews: some View {
        FeatureView(title: "Feature", feature: .constant(true), symbol: "star", color: Color.blue)
    }
}
