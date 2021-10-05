//
//  MapManager+CLLocation.swift
//  Around Town
//
//  Created by jjh9 on 10/5/21.
//

import Foundation
import CoreLocation

extension MapManager {
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .authorizedAlways, .authorizedWhenInUse:
            showsUserLocation = true
            locationManager.startUpdatingLocation()
            userTrackingMode = .follow
        default:
            locationManager.stopUpdatingLocation()
            showsUserLocation = false
            userTrackingMode = .none
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        pins.append(contentsOf: locations.map {Pin(coordinate: $0.coordinate)})
    }
}
