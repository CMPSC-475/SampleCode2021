//
//  MOAddView.swift
//  Do It Now
//
//  Created by Hannan, John Joseph on 10/17/21.
//

import SwiftUI

struct MOAddView: View {
    @EnvironmentObject var manager : TaskManager
    @Binding var isAdding : Bool
    @Environment(\.dismiss) var dismiss
    @State var text : String = ""
    @State var showAlert = false
    
    var body: some View {
        TextField("Enter New Item", text: $text)
            .onSubmit {
                if isValid(text: text) {
                    manager.addItem(title: text)
                    dismiss()
                    isAdding = false
                } else {
                    showAlert = true
                }
            }
            .textFieldStyle(.roundedBorder)
            .padding(20)
           
            .alert("Item cannot be empty", isPresented: $showAlert, actions: {})
    }
    
    func isValid(text:String) -> Bool {
        !text.isEmpty
    }

}

//struct MOAddView_Previews: PreviewProvider {
//    static var previews: some View {
//        MOAddView()
//    }
//}
