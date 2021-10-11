//
//  Tasks.swift
//  Do It Now
//
//  Created by jjh9 on 9/27/20.
//

import Foundation


class TaskManager :ObservableObject {
    let filename = "DoItNow"
    let manager : StorageManager
    let formatter : DateFormatter
    
    @Published var items : [Item]
    
    init() {
        manager = StorageManager()
        items = manager.items
        formatter = DateFormatter()
        formatter.dateStyle = .medium
        
        items.append(contentsOf: [Item(title:"One thing"), Item(title:"Next Thing"), Item(title:"Do Nothing")])
    }
    
    func formatFor(date: Date) -> String {
        formatter.string(from: date)
    }

}
