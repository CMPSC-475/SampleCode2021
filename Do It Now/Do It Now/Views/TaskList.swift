//
//  TaskList.swift
//  Do It Now
//
//  Created by jjh9 on 10/11/21.
//

import SwiftUI

struct TaskList: View {
    @EnvironmentObject var manager : TaskManager
    @State var isAdding = false
    @State var indexSet : Set<UUID> = []
    @State var editMode : EditMode = .inactive
    
    var body: some View {
        NavigationView {
            List(selection: $indexSet) {
                if isAdding {
                    AddView()
                }
                ForEach($manager.items) {$item in
                    ItemRow(item: $item)
                }
                .onMove {indexSet, offset in
                    manager.move(fromOffsets: indexSet, toOffset: offset)
                }
                .onDelete {indexSet in
                    manager.delete(indexSet: indexSet)
                }
            }
            .navigationTitle("Do It Now")
            .navigationBarTitleDisplayMode(.inline)
            
            
//            .sheet(isPresented: $isAdding,
//                   onDismiss: nil) {
//                AddView()
//            }
            
                   .toolbar {
                       ToolbarItem(placement: .primaryAction) {
                           EditButton()
                       }
                       ToolbarItem(placement: .cancellationAction) {
                           Button(action:{isAdding.toggle()}) {
                               Image(systemName: "plus.square")
                           }
                       }
                       ToolbarItem(placement: .bottomBar) {
                           Button(action: {manager.deleteItems(itemIDS: indexSet)}) {
                               Image(systemName: "trash")
                                   .disabled(indexSet.isEmpty)
                           }
                       }
                   }
        }
    }
}

struct TaskList_Previews: PreviewProvider {
    static var previews: some View {
        TaskList()
    }
}
