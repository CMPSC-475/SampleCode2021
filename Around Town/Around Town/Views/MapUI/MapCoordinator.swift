//
//  MapCoordinator.swift
//  Mappy
//
//  Created by Hannan, John Joseph on 6/17/22.
//

import Foundation
import MapKit


class MapViewCoordinator : NSObject, MKMapViewDelegate {
    let map : MKMapView
    let manager : MapManager
    
    init(map:MKMapView, manager:MapManager) {
        self.map = map
        self.manager = manager
    }
    
    //let mapModel = MapModel()
    
    
//    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//        let coord = CLLocationCoordinate2D(latitude: 40.7964685139719, longitude: -77.8628317618596)
//        let pin = MyPin(t: "here", loc: coord)
//        let marker = MKMarkerAnnotationView(annotation: pin, reuseIdentifier: "Bob")
//        return marker
//    }
    
    @objc func dropPin(recognizer:UILongPressGestureRecognizer) {
        guard recognizer.state == .began else { return }
        let point = recognizer.location(in: map)
        let coordinate = map.convert(point, toCoordinateFrom: map)
        let pin = DroppedPin(title: "Here", coordinate: coordinate)
        
        map.addAnnotation(pin)
    }
    
    //MARK: MapView Delegate
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
                  
        switch annotation {
  
        case is DroppedPin: 
            return annotationView(forPin: annotation as! DroppedPin)
        case is Place:
        return annotationView(forPlace: annotation as! Place)
        
        default:
            return nil
        }
    }

    func annotationView(forPin droppedPin:DroppedPin) -> MKAnnotationView {
        let pinIdentifier = "DroppedPin"
        
        let pin = map.dequeueReusableAnnotationView(withIdentifier: pinIdentifier) as? MKPinAnnotationView ??  MKPinAnnotationView(annotation: droppedPin, reuseIdentifier: pinIdentifier)
        pin.pinTintColor = MKPinAnnotationView.purplePinColor()
        pin.animatesDrop = true
        pin.canShowCallout = true
        pin.isDraggable = true
        pin.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        return pin
    }
    
    func annotationView(forPlace place:Place) -> MKAnnotationView {
        let identifier = "Place"
        let marker = map.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView ??  MKAnnotationView(annotation: place, reuseIdentifier: identifier)
        marker.canShowCallout = true
        marker.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        
        //marker.image = UIImage(named: "blue-pin")
        
        let imageName = manager.imageNameFor(category: place.category)
        if let image = UIImage(named: imageName) {
            marker.image = image
        } else {
            marker.image = UIImage(named: "blue-pin")
        }
        return marker
    }
    
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        switch view.annotation {
        case is Place:
            let place = view.annotation as! Place
            manager.showPlace = place
            manager.showConfirmation = true
            /*
            let alertController = UIAlertController(title: place.title, message: "What?", preferredStyle: .actionSheet)
            
            let actionDirections = UIAlertAction(title: "Directions", style: .default) { (action) in
                self.provideDirections(place: place)
            }
            alertController.addAction(actionDirections)
            let actionCancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alertController.addAction(actionCancel)
            
            if let presenter = alertController.popoverPresentationController {
                presenter.sourceView = view
                presenter.sourceRect = view.bounds
                mapView.deselectAnnotation(view.annotation, animated: true)
            }
            */
           // self.present(alertController, animated: true, completion: nil)
            
        default:
            break
        }
        
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        switch overlay {
        case is MKCircle:
            let circleRenderer =  MKCircleRenderer(circle: overlay as! MKCircle)
            circleRenderer.strokeColor = UIColor.blue
            return circleRenderer
        case is MKPolygon:
            let polygonRenderer = MKPolygonRenderer(polygon: overlay as! MKPolygon)
            polygonRenderer.strokeColor = UIColor.lightGray
            polygonRenderer.lineWidth = 2.0
            return polygonRenderer
        case is MKPolyline:
            let polylineRenderer = MKPolylineRenderer(polyline: overlay as! MKPolyline)
            polylineRenderer.strokeColor = UIColor.red
            polylineRenderer.lineWidth = 2.0
            return polylineRenderer
        default:
            assert(false, "Unhandled Overlay")
        }
    }

    
//    func provideDirections(place:Place) {
//        let request = MKDirections.Request()
//        request.source = MKMapItem.forCurrentLocation()
//        request.destination = MKMapItem(placemark: place)
//        request.transportType = .walking
//        request.requestsAlternateRoutes = true
//        
//        let directions = MKDirections(request: request)
//        directions.calculate { (response, error) in
//            guard (error == nil) else {print(error!.localizedDescription); return}
//            
//            if let route = response?.routes.first {
//                self.map.addOverlay(route.polyline)
//            }
//            
//        }
//        
//        
//    }
    
}
