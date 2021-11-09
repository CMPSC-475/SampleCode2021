//
//  FlipImage.swift
//  Jester
//
//  Created by Hannan, John Joseph on 11/9/21.
//

import SwiftUI

struct FlipImage  : View {
    var name : String
    var body: some View {
        Image(name)
            .resizable()
            .aspectRatio(1.0, contentMode: .fit)
    }
}

struct FlipImage_Previews: PreviewProvider {
    static var previews: some View {
        FlipImage(name: "Hamilton Front")
    }
}
