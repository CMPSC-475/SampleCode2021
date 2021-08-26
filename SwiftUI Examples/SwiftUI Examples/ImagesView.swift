//
//  ImagesView.swift
//  SwiftUI Examples
//
//  Created by jjh9 on 8/26/21.
//

import SwiftUI

struct ImagesView: View {
    var body: some View {
        VStack {
            ScrollableImage(name: "Pepper")
            ScrollableImage(name: "Pizza")
        }
    }
}

struct ScrollableImage : View{
    var name: String
    var body: some View {
        //ScrollView([.horizontal, .vertical]) {
            Image(name)
                .resizable()
                .aspectRatio(contentMode: .fit)
        //}
    }
}

struct ImagesView_Previews: PreviewProvider {
    static var previews: some View {
        ImagesView()
            .imageScale(/*@START_MENU_TOKEN@*/.medium/*@END_MENU_TOKEN@*/)
    }
}
