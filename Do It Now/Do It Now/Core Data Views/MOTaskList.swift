//
//  MOTaskList.swift
//  Do It Now
//
//  Created by Hannan, John Joseph on 10/17/21.
//

import SwiftUI

struct MOTaskList: View {
    //@EnvironmentObject var manager : TaskManager
    @Environment(\.managedObjectContext) private var viewContext

    
    @State var indexSet : Set<ItemMO> = []
    @State var editMode : EditMode = .inactive
    @State var isAscending = true
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \ItemMO.date, ascending: true)],
        //predicate: NSPredicate(format: "name contains 'n'"),
        animation: .default)
    private var items: FetchedResults<ItemMO>
    
    var sortDescriptors : [NSSortDescriptor] {[NSSortDescriptor(keyPath:\ItemMO.date, ascending: isAscending)]}
    
    //var fetchRequst : FetchRequest<ItemMO>
   // var items : FetchedResults<ItemMO> { fetchRequst.wrappedValue }
    
//    init(isAscending:Bool) {
//        fetchRequst = FetchRequest<ItemMO>(
//            sortDescriptors: [NSSortDescriptor(keyPath:\ItemMO.date, ascending: isAscending)])
//    }
    
    var body: some View {
        
        List(selection: $indexSet) {
            
            ForEach(items) {item in
                MOSwipeRow(item: item)
            }
        }
        
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                EditButton()
            }
            ToolbarItem(placement: .automatic) {
                Button(action:{isAscending.toggle()
                    //New for iOS15: assigning to nsSortDescriptors
                    items.nsSortDescriptors = sortDescriptors
                }) {
                    Image(systemName: orderImage)
                }
            }
            ToolbarItem(placement: .bottomBar) {
                Button(action: {indexSet.forEach({viewContext.delete($0)})}) {
                    Image(systemName: "trash")
                }
                .disabled(indexSet.isEmpty)
            }
            
        }
    }
    var orderImage : String {isAscending ? "menubar.arrow.down.rectangle" : "menubar.arrow.up.rectangle"}
}

struct MOTaskList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MOTaskList(isAscending: true)
                .environmentObject(TaskManager())
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }
    }
}
