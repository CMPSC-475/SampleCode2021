//
//  SearchButton.swift
//  Downtown
//
//  Created by Hannan, John Joseph on 9/27/21.
//

import SwiftUI

struct SearchButton: View {
    @Binding var selectedCategory : Category?
    //@EnvironmentObject var manager : MapManager
    var body: some View {
        Menu {
            ForEach(Category.allCases, id:\.self) { category in
                Button(category.rawValue.capitalized) {
                    selectedCategory = category
                }
            } } label: {
                Image(systemName: "magnifyingglass")
            }
    }
    
    //        Picker(selection: $selectedCategory, label: Image(systemName: "magnifyingglass")) {
    //            Text("None").tag(nil as Category?)
    //            ForEach(Category.allCases, id:\.self) { category in
    //
    //                Text(category.rawValue.capitalized).tag(category as Category?)
    //            }
    //        }
    
    
}

struct SearchButton_Previews: PreviewProvider {
    static var previews: some View {
        SearchButton(selectedCategory: .constant(.dining))
            .environmentObject(MapManager())
    }
}
