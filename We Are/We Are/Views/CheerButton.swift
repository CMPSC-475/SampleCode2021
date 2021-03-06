//
//  CheerButton.swift
//  We Are
//
//  Created by Hannan, John Joseph on 8/26/21.
//

import SwiftUI

struct CheerButton: View {
    @EnvironmentObject var cheerManager : CheerManager
    var title: String
    var body : some View {
        Button(action: {cheerManager.doACheer()})
        {
            Text(title)
                .font(.largeTitle)
                .bold()
                .foregroundColor(.white)
                .padding()
                .background(Color.blue)
                .cornerRadius(ViewConstants.radius)
                .shadow(radius: ViewConstants.radius)
        }
        .padding(ViewConstants.paddingSize)
        
    }
}

struct CheerButton_Previews: PreviewProvider {
    static var previews: some View {
        CheerButton(title: "Cheer")
        .environmentObject(CheerManager(cheering: PSUCheers()))
    }
}
