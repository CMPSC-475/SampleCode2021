//
//  WeAreView.swift
//  We Are
//
//  Created by Hannan, John Joseph on 8/26/21.
//

import SwiftUI

struct WeAreView: View {
    var body: some View {
        ZStack {
            Color.orange
            VStack {
                LionImage(title: "Mascot")
                CheerText(cheer: "We Are")
                CheerText(cheer: "Penn State")
                Spacer()
                CheerButton(title: "Cheer")
            }
        }
    }
}

struct LionImage : View {
    var title: String
    var body : some View {
        Image(title)
            .shadow(radius: 10)
            .padding()
    }
}

struct CheerButton: View {
    var title: String
    var body : some View {
        Button(action: {})
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

struct CheerText : View {
    var cheer: String
    var body : some View {
        Text(cheer)
            .foregroundColor(.blue)
            
            .font(Font.system(size: ViewConstants.cheerFontSize))
            .bold()
            .padding(ViewConstants.paddingSize)
            .background(Capsule()
                            
                            .strokeBorder(Color.blue, lineWidth: ViewConstants.strokeWidth)
                            .background(Capsule().fill(Color.white)))
        
    }
}

struct WeAreView_Previews: PreviewProvider {
    static var previews: some View {
        WeAreView()
    }
}
