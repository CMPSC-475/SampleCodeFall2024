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
    @Binding var mode : MapInteractionModes
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.region = manager.region
        mapView.showsUserLocation = true
        mapView.showsUserTrackingButton = true
        mapView.delegate = context.coordinator
        
        let dragGesture = UIPanGestureRecognizer(target: context.coordinator, action: #selector(MapViewCoordinator.dragHandler(recognizer:)))
        
        mapView.addGestureRecognizer(dragGesture)
        return mapView
        
    }

    func updateUIView(_ mapView: MKMapView, context: Context) {
        switch mode {
        case .all:
            mapView.isScrollEnabled = true
        default:
            mapView.isScrollEnabled = false
    
        }
        mapView.removeAnnotations(mapView.annotations)
        mapView.removeOverlays(mapView.overlays)
        mapView.addAnnotations(manager.places)
        mapView.addOverlays(manager.polylines)
        
        if let current = manager.currentCircularRegion {
            mapView.addOverlay(current.overlayWithTitle(RegionType.current.rawValue))
        }
        
        mapView.addOverlays(manager.circularRegions.map({$0.overlayWithTitle(RegionType.done.rawValue)}))
    }
    
    
    func makeCoordinator() -> MapViewCoordinator {
        return MapViewCoordinator(manager: manager)
    }
}


#Preview {
    MapViewUIKit(mode: .constant(.all))
        .environment(Manager())
}

