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
        Text("Search Picker")
        
    }
}

struct SearchButton_Previews: PreviewProvider {
    static var previews: some View {
        SearchButton()
            .environmentObject(MapManager())
    }
}
