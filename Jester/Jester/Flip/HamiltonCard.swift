//
//  HamiltonCard.swift
//  Jester
//
//  Created by Hannan, John Joseph on 11/11/21.
//

import SwiftUI

struct HamiltonCard: View {
    var body: some View {

            Flippable(frontContent: {FlipImage(name: "Hamilton Front")},
                      backContent: {FlipImage(name: "Hamilton Back")})
            .padding()
    }
}

struct HamiltonCard_Previews: PreviewProvider {
    static var previews: some View {
        HamiltonCard()
    }
}
