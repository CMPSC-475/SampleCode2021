//
//  CheerText.swift
//  We Are
//
//  Created by Hannan, John Joseph on 8/26/21.
//

import SwiftUI

struct CheerText: View {
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

struct CheerText_Previews: PreviewProvider {
    static var previews: some View {
        CheerText(cheer: "We Are")
    }
}
