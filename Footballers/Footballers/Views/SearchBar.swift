//
//  SearchBar.swift
//  Footballers
//
//  Created by jjh9 on 10/5/20.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchText : String
    @State private var showCancelButton: Bool = false
    
    
    var body: some View {
        HStack {
            HStack {
                TextField(" Search", text: $searchText, onEditingChanged: { _ in
                    self.showCancelButton = true
                })
                
                Button(action: {
                    self.searchText = ""
                }) {
                    Image(systemName: "xmark.circle.fill").opacity(searchText.isEmpty ? 0 : 1)
                }
            }
            .padding(8)
            .background(Color(.secondarySystemBackground))
            .cornerRadius(5.0)
            
            if !searchText.isEmpty  {
                Button("Cancel") {
                    
                    self.searchText = ""
                    self.showCancelButton = false
                }
                .foregroundColor(Color(.systemBlue))
            }
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(searchText: .constant("This"))
    }
}
