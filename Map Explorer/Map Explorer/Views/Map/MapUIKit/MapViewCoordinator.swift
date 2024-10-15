//
//  MapViewCoordinator.swift
//  Map Explorer
//
//  Created by Nader Alfares on 10/14/24.
//
import Foundation
import MapKit

class MapViewCoordinator : NSObject, MKMapViewDelegate {
    var manager : Manager
    init(manager: Manager) {
        self.manager = manager
        super.init()
    }
    
    //MARK: MapView Delegate
    // called when Map needs to display an annotation on the map
   func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        //TODO: complete this code
            return nil
    }
    
    // Callout Accessory triggers this function
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {

        
    }
    
    // Called when Map needs to display an overlay on the map
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {

            MKCircleRenderer()

    }
    
    func mapView(_ mapView: MKMapView, didSelect annotation: MKAnnotation) {
        let place = annotation as! Place
        manager.selectedPlace = place
    }
    
}
