//
//  AddView.swift
//  Do It Now
//
//  Created by Hannan, John Joseph on 10/13/21.
//

import SwiftUI

struct AddView: View {
    @EnvironmentObject var manager : TaskManager
    @Environment(\.dismiss) var dismiss
    @State var text : String = ""
    @State var showAlert = false
    
    var body: some View {
        TextField("Enter New Item", text: $text)
  
            .textFieldStyle(RoundedBorderTextFieldStyle())
 
    }
    

}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}
