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
    
    var title : String { self.placeMark.name ?? "" }
    var address : String { get {(self.subThoroughfare ?? "") + " " + (self.thoroughfare ?? "")} }
    var name : String {customName ?? placeMark.name ?? "No Name"}
    var thoroughfare : String? {self.placeMark.thoroughfare}
    var subThoroughfare : String? {self.placeMark.subThoroughfare}
    var id  = UUID()
    
    
    var route : MKRoute?  // Route generated when requested.  Reset to nil when done.
    
    static var standard = Place(placeMark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 40.79550030, longitude: -77.85900170)), category: .coffee)
    
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
