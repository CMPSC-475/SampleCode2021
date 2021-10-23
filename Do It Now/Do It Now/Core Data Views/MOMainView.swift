//
//  MOMainView.swift
//  Do It Now
//
//  Created by Hannan, John Joseph on 10/17/21.
//

import SwiftUI

struct MOMainView: View {
    //@EnvironmentObject var manager : TaskManager

    @State var isAscending = true
    @State var isAdding = false
    
    var body: some View {
        NavigationView {
            VStack {
                if isAdding {
                    MOAddView(isAdding: $isAdding)
                        .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .trailing)))
                }
                
                MOTaskList() //(isAscending: isAscending)
            }

            .animation(.easeInOut, value: isAdding)
            .navigationTitle("Do It Now")
            .navigationBarTitleDisplayMode(.inline)

            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button(action:{isAdding.toggle()}) {
                        Image(systemName: "plus.square")
                    }
                }


            }
        }
    }

}

struct MOMainView_Previews: PreviewProvider {
    static var previews: some View {
        MOMainView()
    }
}
