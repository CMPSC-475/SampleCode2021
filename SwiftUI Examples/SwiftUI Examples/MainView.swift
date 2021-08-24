//
//  MainView.swift
//  SwiftUI Examples
//
//  Created by jjh9 on 8/24/21.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0..<888) {i in
                    TextView(index: i)
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

struct TextView: View {
    var index : Int
    var body: some View {
        Text("\(index)")
    }
}
