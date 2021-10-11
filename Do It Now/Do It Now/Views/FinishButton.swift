//
//  FinishButton.swift
//  Do It Now
//
//  Created by jjh9 on 10/11/21.
//

import SwiftUI

struct FinishButton: View {
    @EnvironmentObject var manager : TaskManager
    @Binding var item:Item
    var iconName : String {item.done ? "checkmark.square" : "square" }
    var body: some View {
        Button(action: {item.done.toggle()}) {
            Image(systemName: iconName )
        }
    }
}

struct FinishButton_Previews: PreviewProvider {
    static var previews: some View {
        FinishButton(item: .constant(Item.standard))
    }
}
