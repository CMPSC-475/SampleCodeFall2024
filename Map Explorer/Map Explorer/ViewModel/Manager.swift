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
    override init() {
        
        super.init()
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
    }
    
    
}

extension Manager : CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .notDetermined:
            manager.requestWhenInUseAuthorization()
        case .authorizedAlways, .authorizedWhenInUse:
            manager.startUpdatingLocation()
        default:
            manager.stopUpdatingLocation()
        }
        
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        
    }
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}
