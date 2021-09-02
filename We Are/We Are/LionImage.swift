//
//  LionImage.swift
//  We Are
//
//  Created by Hannan, John Joseph on 8/26/21.
//

import SwiftUI

struct LionImage: View {
    @EnvironmentObject var cheerManager : CheerManager
    //var title: String
    var body : some View {
        Image(cheerManager.cheerState.mascotImageName)
            .shadow(radius: 10)
            .padding()
    }
}

struct LionImage_Previews: PreviewProvider {
    static var previews: some View {
        LionImage()
        .environmentObject(CheerManager())
    }
}
