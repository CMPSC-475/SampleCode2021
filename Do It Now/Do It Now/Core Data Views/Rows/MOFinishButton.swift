//
//  MOFinishButton.swift
//  Do It Now
//
//  Created by Hannan, John Joseph on 10/17/21.
//

import SwiftUI

struct MOFinishButton: View {
    @EnvironmentObject var manager : TaskManager
    @Binding var item:Item
    var iconName : String {item.done ? "checkmark.square" : "square" }
    var body: some View {
        Button(action: {item.done.toggle()}) {
            Image(systemName: iconName )
        }
        .foregroundColor(.accentColor)
    }
}

//struct MOFinishButton_Previews: PreviewProvider {
//    static var previews: some View {
//        MOFinishButton()
//    }
//}
