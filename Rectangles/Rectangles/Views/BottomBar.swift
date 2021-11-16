//
//  BottomBar.swift
//  Rectangles
//
//  Created by jjh9 on 11/16/21.
//

import SwiftUI

struct BottomBar: View {
    @EnvironmentObject var manager : GameManager

    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button(action: {/*TODO: Action*/})
                {Image(systemName:"trash.fill")}
                Spacer()
            }
        }
    }
}

struct BottomBar_Previews: PreviewProvider {
    static var previews: some View {
        BottomBar()
    }
}
