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
    
    @State var showDetails = false
    
    var body: some View {
        VStack {
            
            NavigationLink(destination: SpotView(spot: $spot), isActive: $showDetails, label: {EmptyView()})
            
            Map(coordinateRegion: $manager.region, annotationItems: manager.places, annotationContent: annotationFor(place:))
            //            .actionSheet(item: $spot) { spot in
            //                ActionSheet(title: Text(spot.title ?? "No Title"),
            //                            message: Text(spot.subtitle ?? "No Subtitle"),
            //                            buttons: [
            //                                Alert.Button.default(Text("Directions"), action: {}),
            //                                Alert.Button.destructive(Text("Delete"), action: {}),
            //                                Alert.Button.cancel()])
            //
            //
            //            }
                .confirmationDialog("Title",
                                    isPresented: $showingSpot,
                                    presenting: spot,
                                    actions: { theSpot in
                    VStack {
                        Button("Directions to \(theSpot.title ?? "Nowhere")") {}
                        Button("Delete", role: .destructive) {}
                        //Button("Cancel", role: .cancel) {}
                    }
                }, message: { sp in
                    Text(spot?.title ?? "No Title")
                    
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
