//
//  DowntownMap.swift
//  Downtown
//
//  Created by Hannan, John Joseph on 9/27/21.
//

import SwiftUI
import MapKit


struct DowntownMap: View {
    @EnvironmentObject var manager : MapManager

    
    var body: some View {
        Text("Map Here")
    }

}

struct DowntownMap_Previews: PreviewProvider {
    static var previews: some View {
        DowntownMap()
            .environmentObject(MapManager())
    }
}
