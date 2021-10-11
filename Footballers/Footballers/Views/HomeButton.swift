//
//  HomeButton.swift
//  Footballers
//
//  Created by jjh9 on 10/11/21.
//

import SwiftUI

struct HomeButton: View {
    var title : String
    var body : some View {
        ZStack {
            Image("football").resizable()
                .frame(width: dim, height: dim, alignment: .center)
                .opacity(0.75)
            Text(title).font(Font.largeTitle)
        }
    }
    var dim : CGFloat = 200
}

struct HomeButton_Previews: PreviewProvider {
    static var previews: some View {
        HomeButton(title: "Footballers")
    }
}
