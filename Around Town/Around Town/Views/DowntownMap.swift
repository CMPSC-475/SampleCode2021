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
    @State var spot : Spot?
    
    var body: some View {
        Map(coordinateRegion: $manager.region, annotationItems: manager.locationModel.favorites, annotationContent: annotationFor(spot:))
            .actionSheet(item: $spot) { Spot in
               [ Alert.Button.cancel()]
            }
    }

}

struct DowntownMap_Previews: PreviewProvider {
    static var previews: some View {
        DowntownMap()
            .environmentObject(MapManager())
    }
}
