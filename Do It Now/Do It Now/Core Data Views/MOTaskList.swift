//
//  MOTaskList.swift
//  Do It Now
//
//  Created by Hannan, John Joseph on 10/17/21.
//

import SwiftUI

struct MOTaskList: View {
    @EnvironmentObject var manager : TaskManager
    @Environment(\.managedObjectContext) private var viewContext

    
    @State var indexSet : Set<UUID> = []
    @State var editMode : EditMode = .inactive
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \ItemMO.date, ascending: true)],
        //predicate: NSPredicate(format: "name contains 'n'"),
        animation: .default)
    private var items: FetchedResults<ItemMO>
    
    var body: some View {
        
        List(selection: $indexSet) {
            
            ForEach(items) {item in
                SwipeRow(item: item)
            }
        }
        
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                EditButton()
            }
            ToolbarItem(placement: .bottomBar) {
                Button(action: {manager.deleteItems(itemIDS: indexSet)}) {
                    Image(systemName: "trash")
                }
                .disabled(indexSet.isEmpty)
            }
            
        }
    }
}

//struct MOTaskList_Previews: PreviewProvider {
//    static var previews: some View {
//        MOTaskList()
//    }
//}
