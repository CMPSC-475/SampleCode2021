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
    @State var spot : Spot?  // for action sheet or confirmation dialog
    @State var showingSpot = false  // for showing confirmation dialog
    @State var place : Place?  // for  confirmation dialog
    @State var showingPlace = false  // for showing confirmation dialog
    @State var showDetails = false
    @State var userTrackingMode : MapUserTrackingMode = .follow

    
    var body: some View {
        VStack {
            
            NavigationLink(destination: SpotView(spot: $spot), isActive: $showDetails, label: {EmptyView()})
            
            Map(coordinateRegion: $manager.region, interactionModes: .all, showsUserLocation: manager.showsUserLocation, userTrackingMode: $userTrackingMode, annotationItems: manager.places , annotationContent: annotationFor(place:) )

                .confirmationDialog("Title",
                                    isPresented: $showingPlace,
                                    presenting: place,
                                    actions: { thePlace in
                    VStack {
                        Button("Directions to \(thePlace.title ?? "??")") {manager.provideDirections(for: thePlace)}
                        Button("Delete", role: .destructive) {manager.delete(place: thePlace)}
                    }
                }, message: { place in
                    Text(place.title ?? "No Name")
                    
                })
            
        }
    }
    
}

struct DowntownMap_Previews: PreviewProvider {
    static var previews: some View {
        DowntownMap()
            .environmentObject(MapManager())
    }
}
