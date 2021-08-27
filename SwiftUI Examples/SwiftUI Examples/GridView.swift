//
//  GridView.swift
//  SwiftUI Examples
//
//  Created by Hannan, John Joseph on 8/27/21.
//

import SwiftUI

struct GridView: View {
    let columns = 4
    let rows = 5
    
    var body: some View {
        
        ScrollView {
            VStack {
                ForEach(0..<rows) {r in
                    HStack {
                        ForEach(0..<self.columns) { c in
                            Color.randomColor
                                .aspectRatio(1.0, contentMode: .fit)
                                .cornerRadius(15)
                        }
                    }
                }.padding()
            }
        }
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
    }
}
