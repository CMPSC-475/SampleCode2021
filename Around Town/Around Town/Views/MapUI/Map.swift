//
//  Map.swift
//  Mappy
//
//  Created by Hannan, John Joseph on 6/16/22.
//

import Foundation

import SwiftUI
import MapKit

struct MapViewUIKit: UIViewRepresentable {
    // 1.
    let region: MKCoordinateRegion
    let mapType : MKMapType
    let annotations : [MKAnnotation]
    let overlays : [MKOverlay]
    let manager : MapManager
    
    var mapView = MKMapView()
    
    // 2.
    func makeUIView(context: Context) -> MKMapView {
        //mapView = MKMapView()
        mapView.setRegion(region, animated: false)
        mapView.mapType = mapType
        mapView.delegate = context.coordinator
        mapView.showsUserLocation = manager.showsUserLocation
        
        let longPress = UILongPressGestureRecognizer(target: context.coordinator, action: #selector(MapViewCoordinator.dropPin(recognizer:)))
        mapView.addGestureRecognizer(longPress)
        
        mapView.showsUserLocation = true
        return mapView
    }
    
    // 3.
    func updateUIView(_ mapView: MKMapView, context: Context) {
        mapView.mapType = mapType
        mapView.removeAnnotations(mapView.annotations)
        mapView.addAnnotations(annotations)
//        for a in annotations {
//            mapView.addAnnotation(a)
//        }
        
        mapView.addOverlays(overlays)
        
        print("Annotation Count: \(annotations.count)")
        print("Overlay Count: \(overlays.count)")

    }
    
    func makeCoordinator() -> MapViewCoordinator {
        return MapViewCoordinator(map: mapView, manager: manager)
    }
    

}


