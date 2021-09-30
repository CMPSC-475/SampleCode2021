//
//  SearchButton.swift
//  Downtown
//
//  Created by Hannan, John Joseph on 9/27/21.
//

import SwiftUI

struct SearchButton: View {
    @EnvironmentObject var manager : MapManager
    var body: some View {
        Picker(selection: $manager.selectedCategory, label: Image(systemName: "magnifyingglass")) {
            Text("None").tag(nil as Category?)
            ForEach(Category.allCases, id:\.self) { category in
 
                Text(category.rawValue.capitalized).tag(category as Category?)
            }
        }
        
    }
}

struct SearchButton_Previews: PreviewProvider {
    static var previews: some View {
        SearchButton()
            .environmentObject(MapManager())
    }
}
