//
//  DroppedPin.swift
//  Around Town
//
//  Created by Hannan, John Joseph on 6/21/22.
//

import Foundation
import MapKit

class DroppedPin : NSObject, MKAnnotation {
        var coordinate: CLLocationCoordinate2D
        var title: String?
    init(title: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.coordinate = coordinate
    }
}
