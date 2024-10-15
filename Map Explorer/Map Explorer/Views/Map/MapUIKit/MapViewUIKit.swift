//
//  MapViewUIKit.swift
//  Map Explorer
//
//  Created by Nader Alfares on 10/14/24.
//

import Foundation
import SwiftUI
import MapKit


struct MapViewUIKit : UIViewRepresentable {
    @Environment(Manager.self) var manager
 
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.region = manager.region
        mapView.showsUserLocation = true
        mapView.showsUserTrackingButton = true
        mapView.delegate = context.coordinator
        return mapView
        
    }

    func updateUIView(_ mapView: MKMapView, context: Context) {
        mapView.removeAnnotations(mapView.annotations)
        mapView.addAnnotations(manager.places)
    }
    
    
    func makeCoordinator() -> MapViewCoordinator {
        return MapViewCoordinator(manager: manager)
    }
}


#Preview {
    MapViewUIKit()
        .environment(Manager())
}

