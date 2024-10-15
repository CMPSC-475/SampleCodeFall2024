//
//  Manager.swift
//  Map Explorer
//
//  Created by Nader Alfares on 9/28/24.
//
import Foundation
import SwiftUI
import MapKit

@Observable
class Manager : NSObject {
    
    //MARK: - Annotation Support -
    var favorites = [Favorite(coord: Coord(latitude: 40.79550030, longitude: -77.85900170), title: "Cheese Shoppe"),
                               Favorite(coord: Coord(latitude: +40.79414797, longitude:
                                                    -77.86152899), title: "The Corner Room")]
    
    var places = [Place]()
    
    var region = MKCoordinateRegion(center: .stateCollege, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    
    var showFavorites: Bool = false
    
    let locationManager: CLLocationManager = .init()
    
    var showLocationDescription : String?
    var showAlert = false
    
    var routes = [MKRoute]()
    
    // Region drawn on map
    var currentCircularRegion : CircleRegion?
    var circularRegions : [CircleRegion] = []
    
    var downtownOverlay : MKPolygon {MKPolygon(coordinates: CLLocationCoordinate2D.downtownCoordinates, count: CLLocationCoordinate2D.downtownCoordinates.count)}
    
    var selectedPlace : Place?
    
    override init() {
        
        super.init()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
    }
    
    func toggleFavorites() {
        showFavorites.toggle()
    }
    

    func clearAll() {
        places.removeAll()
    }
    
}


