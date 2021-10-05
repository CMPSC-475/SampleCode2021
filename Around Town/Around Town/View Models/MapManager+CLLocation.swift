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
            locationManager.startUpdatingLocation()
        default:
            locationManager.stopUpdatingLocation()
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
         
    }
}
