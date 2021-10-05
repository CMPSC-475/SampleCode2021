//
//  Map+Annotation.swift
//  Around Town
//
//  Created by jjh9 on 9/28/21.
//

import SwiftUI
import MapKit


extension DowntownMap {
    
    func markerFor(spot:Spot) -> some MapAnnotationProtocol {
        MapPin(coordinate: spot.coordinate, tint: .blue)
    }
    
    func pinFor(pin:Pin)-> some MapAnnotationProtocol {
        MapPin(coordinate: pin.coordinate, tint: .blue)
    }
    
    func annotationFor(spot:Spot) -> some MapAnnotationProtocol {
        MapAnnotation(coordinate: spot.coordinate) {
            Button(action: {showingSpot = true; self.spot = spot})
                   {Image(systemName: "mappin.circle")
                           .scaleEffect(1.5)
                   }

        }
    }
    
    func annotationFor(place:Place) -> some MapAnnotationProtocol {
        MapAnnotation(coordinate: place.coordinate)  {
            Button(action: {showingPlace = true; self.place = place})
            {Image(manager.imageNameFor(category: place.category! ))}
                   
        }
    }
    
    func menuFor(spot:Spot) -> some MapAnnotationProtocol {
        MapAnnotation(coordinate: spot.coordinate) {
                   Image(systemName: "mappin.circle")
                           .scaleEffect(1.5)
                           .contextMenu {
                               Text((spot.title!))
                               Button(action: {showDetails = true; self.spot=spot}) {
                                   Label("Details", systemImage: "info")
                               }
                           }
                   

        }
    }
}
