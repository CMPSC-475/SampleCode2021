//
//  BackgroundView.swift
//  Rectangles
//
//  Created by Hannan, John Joseph on 11/12/21.
//

import SwiftUI

struct BackgroundView: View {
    @EnvironmentObject var manager : GameManager
    
    var body: some View {
        ZStack {
            Color.gray
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {self.manager.removeAll()})
                    {Image(systemName:"trash.fill")}
                    Spacer()
                }
            }
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
