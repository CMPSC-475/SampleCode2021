//
//  MapPicker.swift
//  Mappy
//
//  Created by Hannan, John Joseph on 6/17/22.
//

import SwiftUI
import MapKit
    

struct MapPicker: View {
    @Binding var mapType : MKMapType
    var body: some View {
        Picker("", selection: $mapType) {
            Text("Standard").tag(MKMapType.standard)
            Text("Satellite").tag(MKMapType.satellite)
            Text("Hybrid").tag(MKMapType.hybrid)
        }
        .pickerStyle(SegmentedPickerStyle())
        .offset(y: -40)
        .font(.largeTitle)
    }
}

struct MapPicker_Previews: PreviewProvider {
    static var previews: some View {
        MapPicker(mapType: .constant(.standard))
    }
}
