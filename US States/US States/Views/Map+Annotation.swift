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
    
    func annotationFor(spot:Spot) -> some MapAnnotationProtocol {
        MapAnnotation(coordinate: spot.coordinate) {
            Button(action: {showingSpot = true; self.spot = spot})
                   {Image(systemName: "mappin.circle")
                           .scaleEffect(1.5)
                   }
//            NavigationLink(destination: SpotView(spot: spot)) {
//                Image(systemName: "mappin")
//
//            }
        }
    }
    
    func annotationFor(place:Place) -> some MapAnnotationProtocol {
        MapAnnotation(coordinate: place.coordinate)  {
            Image(manager.imageNameFor(category: place.category! ))
                   
//            NavigationLink(destination: SpotView(spot: spot)) {
//                Image(systemName: "mappin")
//
//            }
        }
    }
    
    func menuFor(spot:Spot) -> some MapAnnotationProtocol {
        MapAnnotation(coordinate: spot.coordinate) {
                   Image(systemName: "mappin.circle")
                           .scaleEffect(1.5)
                           .contextMenu {
                               Text((spot.title!))
                               Button(action: {showDetails = true}) {
                                   Label("Details", systemImage: "info")
                               }
                           }
                   

        }
    }
}