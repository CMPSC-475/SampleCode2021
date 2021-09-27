//
//  Place.swift
//  Around Town
//
//  Created by jjh9 on 9/18/20.
//

import Foundation
import MapKit


struct Place :  Identifiable, Equatable {
    let category : Category?
    var highlighted = false
    var placeMark : MKPlacemark
    var phoneNumber : String
    var url : String
    var customName : String?
    var id  = UUID()
    
    static var standard = Place(placeMark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 40.79550030, longitude: -77.85900170)), category: .coffee)
}


// Computed Properties
extension Place {
    var title : String { self.placeMark.name ?? "" }
    var address : String { get {(self.subThoroughfare ?? "") + " " + (self.thoroughfare ?? "")} }
    var name : String {customName ?? placeMark.name ?? "No Name"}
    var thoroughfare : String? {self.placeMark.thoroughfare}
    var subThoroughfare : String? {self.placeMark.subThoroughfare}
}


// Custom Initializers
extension Place {
    init(placeMark:MKPlacemark, category:Category?) {
        self.category = category
        self.placeMark = placeMark
        self.phoneNumber = ""
        self.url = ""
    }
    
    init(mapItem:MKMapItem, category:Category?) {
        self.category = category
        self.placeMark = mapItem.placemark
        self.phoneNumber = mapItem.phoneNumber ?? ""
        self.url = mapItem.url?.description ?? ""
    }
    
    init(placeMark:MKPlacemark, category:Category?, name:String) {

        self.init(placeMark:placeMark, category:category)
        self.customName = name
    }
}
