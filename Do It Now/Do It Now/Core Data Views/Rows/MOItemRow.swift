//
//  MOItemRow.swift
//  Do It Now
//
//  Created by Hannan, John Joseph on 10/17/21.
//

import SwiftUI

struct MOItemRow: View {
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

//struct MOItemRow_Previews: PreviewProvider {
//    static var previews: some View {
//        MOItemRow()
//    }
//}
