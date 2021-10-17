//
//  ItemRow.swift
//  Do It Now
//
//  Created by jjh9 on 10/11/21.
//

import SwiftUI

struct ItemRow: View {
    @EnvironmentObject var manager : TaskManager
    
    @Binding var item:Item
    let fontSize : CGFloat = 22
    var body: some View {
        HStack {
            VStack(alignment:.leading) {
                Text(item.title)
                    .font(.system(size: fontSize))
                Text(manager.formatFor(date: item.date))
                    .italic()
            }
            Spacer()
            FinishButton(item: $item)
            
        }
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: .constant(Item.standard))
    }
}
