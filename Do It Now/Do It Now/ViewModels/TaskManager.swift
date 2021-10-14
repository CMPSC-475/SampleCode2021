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
    
    func delete(item:Item){
        if let index = items.firstIndex(where: {$0.id == item.id}) {
            items.remove(at: index)
        }
    }
    
    func toggleDone(item:Item) {
        if let index = items.firstIndex(where: {$0.id == item.id}) {
            items[index].done.toggle()
        }
    }
    func deleteItems(itemIDS: Set<UUID>) {

        let offsets = Array(itemIDS).compactMap {id in items.firstIndex(where: {item in item.id == id})}

        let _ = items.remove(atOffsets: IndexSet(offsets))
        
    }
    
    
    func move(fromOffsets indexSet:IndexSet, toOffset index:Int) {
        items.move(fromOffsets: indexSet, toOffset: index)
    }
    
    
    func addItem(title:String) {
        let item = Item(title: title)        
        items.insert(item, at: 0)
    }

}
