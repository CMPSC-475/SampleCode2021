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
            background
            VStack {
                LionImage(title: "Mascot")
                CheerText(cheer: "We Are")
                CheerText(cheer: "Penn State")
                Spacer()
                CheerButton(title: "Cheer")
            }
        }

    }
    
    let background : some View = Color.orange
        .ignoresSafeArea()
}




struct WeAreView_Previews: PreviewProvider {
    static var previews: some View {
        WeAreView()
    }
}
