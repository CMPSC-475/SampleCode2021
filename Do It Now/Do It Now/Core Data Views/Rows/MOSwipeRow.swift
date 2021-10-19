//
//  MOSwipeRow.swift
//  Do It Now
//
//  Created by Hannan, John Joseph on 10/17/21.
//

import SwiftUI

struct MOSwipeRow: View {
    //@EnvironmentObject var manager : TaskManager
    @Environment(\.managedObjectContext) private var viewContext

    
    @ObservedObject var item : ItemMO
    
    var body: some View {
        MOItemRow(item: item)
            .swipeActions(edge: .trailing) {
                Button(role: .destructive) {viewContext.delete(item)}
            label: {                     Label("Delete", systemImage: "trash.fill")      }
            }
            .swipeActions(edge: .leading) {
                Button(role: .none) {item.done.toggle()}
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
