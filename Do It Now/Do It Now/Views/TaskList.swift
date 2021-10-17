//
//  TaskList.swift
//  Do It Now
//
//  Created by jjh9 on 10/11/21.
//

import SwiftUI

struct TaskList: View {
    @EnvironmentObject var manager : TaskManager
    @State var indexSet : Set<UUID> = []
    @State var editMode : EditMode = .inactive
    
    var body: some View {
        
        List(selection: $indexSet) {
            
            ForEach($manager.items) {$item in
                SwipeRow(item: $item)
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

struct TaskList_Previews: PreviewProvider {
    static var previews: some View {
        TaskList()
    }
}
