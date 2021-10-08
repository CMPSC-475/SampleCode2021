//
//  DiningMenu.swift
//  Downtown
//
//  Created by Hannan, John Joseph on 10/2/21.
//

import SwiftUI



struct DiningMenu : View {
    @EnvironmentObject var manager : MapManager
    var body: some View {
        Menu {
            ForEach(manager.restaurants.indices, id:\.self) {index in
                Button(manager.restaurants[index].name) {
                    manager.selectedRestaurantIndex = index
                }
            }
        } label: {
            Image(systemName: "fork.knife.circle")
        }
    }
}

struct DiningMenu_Previews: PreviewProvider {
    static var previews: some View {
        DiningMenu()
            .environmentObject(MapManager())
    }
}
