//
//  MapManager.swift
//  Mappy
//
//  Created by Hannan, John Joseph on 9/26/21.
//

import Foundation
import MapKit


class MapManager : NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var locationModel : LocationModel
    @Published var region : MKCoordinateRegion
    
    let locationManager : CLLocationManager
    
    let spanDelta = 0.01
    
    override init() {
    
        
        let locationModel = LocationModel()
        let center : CLLocationCoordinate2D = CLLocationCoordinate2D(latitude:  locationModel.centerCoord.latitude, longitude: locationModel.centerCoord.longitude)
        let span = MKCoordinateSpan(latitudeDelta: spanDelta, longitudeDelta: spanDelta)
        region = MKCoordinateRegion(center: center, span: span)
        self.locationModel = locationModel
        
        locationManager = CLLocationManager()
        super.init()
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        
        
    }
    
    //MARK: - Modifying Places -
    func delete(place:Place) {
        // firstIndex requires Place to conform to Equatable protocol
        if let index = places.firstIndex(of: place) {
            places.remove(at: index)
        }
    }
    
    //MARK: - Restaurants -
    // List of restaurant names & addresses read in from JSON file
    let restaurants = Restaurant.restaurants
    
    // when user selects a restaurant we annotate map with it
    var selectedRestaurantIndex : Int = 0
    
    
    
    //MARK: - Searching -
    @Published var selectedCategory : Category? {
        didSet {
            performSearch(on: selectedCategory)
        }
    }
    @Published var places : [Place] = []
    
    func imageNameFor(category : Category) -> String {
        category.rawValue.capitalized
    }
    
    func performSearch(on category:Category?) {
        places = []
        
        guard let category = category else {return}
        
        //make a request
        let request = MKLocalSearch.Request()
        request.region = region
        request.naturalLanguageQuery = category.rawValue
        let search = MKLocalSearch(request: request)
        search.start { response, error in
            guard error == nil else { return }
            let mapItems = response!.mapItems
            for item in mapItems {
                let place = Place(mapItem: item, category: category)
                self.places.append(place)
            }
        }
    }
    
}

// define extension here to have support for CoreLocation
extension Spot  {
    var coordinate : CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: self.coord.latitude, longitude: self.coord.longitude)
    }

}
