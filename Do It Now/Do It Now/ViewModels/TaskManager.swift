//
//  Tasks.swift
//  Do It Now
//
//  Created by jjh9 on 9/27/20.
//

import Foundation


class TaskManager :ObservableObject {
    let filename = "DoItNow"
    let manager : StorageManager<Item>
    let formatter : DateFormatter
    
    @Published var items : [Item]
    
    init() {
        manager = StorageManager(filename: filename)
        items = manager.modelData
        formatter = DateFormatter()
        formatter.dateStyle = .medium
        
        items.append(contentsOf: [Item(title:"One thing"), Item(title:"Next Thing"), Item(title:"Do Nothing")])
    }
    
    func formatFor(date: Date) -> String {
        formatter.string(from: date)
    }
    
    func delete(indexSet : IndexSet) {
        let _ = items.remove(atOffsets: indexSet)
    }
    
    func move(fromOffsets indexSet:IndexSet, toOffset index:Int) {
        items.move(fromOffsets: indexSet, toOffset: index)
    }

}
