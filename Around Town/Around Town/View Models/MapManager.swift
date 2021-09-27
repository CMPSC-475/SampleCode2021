//
//  MapManager.swift
//  Mappy
//
//  Created by Hannan, John Joseph on 9/26/21.
//

import Foundation
import MapKit


class MapManager : ObservableObject {
    @Published var locationModel = LocationModel()
    
    
    let spanDelta = 0.01
    
    init() {

    }
    
    
    
}

// define extension here to have support for CoreLocation
extension Spot  {
    var coordinate : CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: self.coord.latitude, longitude: self.coord.longitude)
    }

}
