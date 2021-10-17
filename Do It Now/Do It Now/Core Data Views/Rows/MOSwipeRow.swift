//
//  MOSwipeRow.swift
//  Do It Now
//
//  Created by Hannan, John Joseph on 10/17/21.
//

import SwiftUI

struct MOSwipeRow: View {
    @EnvironmentObject var manager : TaskManager
    @Binding var item : Item
    
    var body: some View {
        ItemRow(item: $item)
            .swipeActions(edge: .trailing) {
                Button(role: .destructive) {manager.delete(item: item)}
            label: {                     Label("Delete", systemImage: "trash.fill")      }
            }
            .swipeActions(edge: .leading) {
                Button(role: .none) {manager.toggleDone(item: item)}
            label: {                     Label("Done", systemImage: "checkmark")      }
            .tint(.blue)
            }
    }
}

//struct MOSwipeRow_Previews: PreviewProvider {
//    static var previews: some View {
//        MOSwipeRow()
//    }
//}
