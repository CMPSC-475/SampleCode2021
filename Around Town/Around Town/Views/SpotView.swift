//
//  SpotView.swift
//  Downtown
//
//  Created by Hannan, John Joseph on 9/27/21.
//

import SwiftUI

struct SpotView: View {
    var spot : Spot?
    var body: some View {
        if let spot = spot {
            Text("Hello \(spot.title ?? "Nobody")")
        } else {
            Text("Hello Nobody")
        }
        
    }
}

struct SpotView_Previews: PreviewProvider {
    static var previews: some View {
        SpotView(spot: (LocationModel().favorites[0]))
    }
}
