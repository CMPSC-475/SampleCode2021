//
//  ContentView.swift
//  Mappy
//
//  Created by Hannan, John Joseph on 6/16/22.
//

import SwiftUI
import MapKit

struct MapUIView: View {
    @EnvironmentObject var manager : MapManager
    
//    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.7964685139719, longitude: -77.8628317618596) , span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    
    @State private var mapType: MKMapType = .standard
    @State private var annotations : [MKAnnotation] = []
    @State private var category : Category? = nil
    @State private var place : Place?
    @State private var showConfirmation = false
    
    //[MyPin(t: "here", loc: CLLocationCoordinate2D(latitude: 40.7964685139719, longitude: -77.8628317618596))]
    var body: some View {
        NavigationView {
            //ZStack {
            MapViewUIKit(region: manager.region, mapType: mapType, annotations: manager.annotations, overlays: manager.overlays, manager: manager)
                    .edgesIgnoringSafeArea(.all)
                
//                VStack {
//                    Spacer()
//                    MapPicker(mapType: $mapType)
//                }
            //}
            .confirmationDialog("Action", isPresented: $manager.showConfirmation, presenting: manager.showPlace, actions: { aPlace in
                Button("Directions to \(aPlace.title ?? "??")") {manager.provideDirections(for: aPlace)}
                Button("Delete", role: .destructive) {manager.delete(place: aPlace)}
            })
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    SearchButton(selectedCategory: $manager.selectedCategory)
                }
                ToolbarItem(placement: .principal) {
                                            Text("Downtown")
                                        }
                    ToolbarItem(placement: .navigationBarLeading) {
                        DiningMenu()
                    }
            }
        }
    }
    
 
}

struct MapUIView_Previews: PreviewProvider {
    static var previews: some View {
        MapUIView()
    }
}
