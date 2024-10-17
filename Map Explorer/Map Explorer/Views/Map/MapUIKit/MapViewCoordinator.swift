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
       let markerID = "Place"
       let clusterID = "Cluster"
        switch annotation {
        case is Place:
            let marker =  (mapView.dequeueReusableAnnotationView(withIdentifier: markerID) ??
                           MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: markerID)) as! MKMarkerAnnotationView
            if let place = annotation as? Place {
                marker.glyphImage = UIImage(systemName: place.category.systemName)
                marker.tintColor = .orange
                marker.glyphTintColor = .purple
            }
            return marker
        case is MKClusterAnnotation:
            let cluster = annotation as! MKClusterAnnotation
            let clusterView = (mapView.dequeueReusableAnnotationView(withIdentifier: clusterID) ??
                               MKMarkerAnnotationView(annotation: cluster, reuseIdentifier: clusterID)) as! MKMarkerAnnotationView
            clusterView.glyphText = "\(cluster.memberAnnotations.count)"
            clusterView.markerTintColor = .blue
            return clusterView
        default:
            return nil
       }
    }
    
    func mapView(_ mapView: MKMapView, clusterAnnotationForMemberAnnotations memberAnnotations: [any MKAnnotation]) -> MKClusterAnnotation {
        return MKClusterAnnotation(memberAnnotations: memberAnnotations)
    }
    
    // Callout Accessory triggers this function
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {

        
    }
    
    // Called when Map needs to display an overlay on the map
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {

       switch overlay {
        case is MKCircle:
           let circleRenderer = MKCircleRenderer(overlay: overlay as! MKCircle)
           circleRenderer.lineWidth = 2.0
           let color = overlay.title == RegionType.current.rawValue ? UIColor.blue : UIColor.lightGray
           circleRenderer.strokeColor = color
           circleRenderer.fillColor = color.withAlphaComponent(0.3)
           return circleRenderer
           
       case is MKPolyline:
           let polylineRenderer = MKPolylineRenderer(overlay: overlay as! MKPolyline)
           polylineRenderer.lineWidth = 4.0
           polylineRenderer.strokeColor = UIColor.red
           return polylineRenderer
           
        default :
           return MKOverlayRenderer(overlay: overlay)
            
        }

    }
    
    func mapView(_ mapView: MKMapView, didSelect annotation: MKAnnotation) {
        if let selectedPlace = annotation as? Place {
            manager.selectedPlace = selectedPlace
        }
    }
    
    var centerCoordinate: CLLocationCoordinate2D?
    @objc
    func dragHandler(recognizer: UIPanGestureRecognizer) {
        let mapView = recognizer.view as! MKMapView
        switch recognizer.state {
        case .began:
            let point = recognizer.location(in: mapView)
            let center = mapView.convert(point, toCoordinateFrom: mapView)
            manager.updateCurrentRegion(center: center, edge: center)
            centerCoordinate = center
        case .changed:
            let point = recognizer.location(in: mapView)
            let edge = mapView.convert(point, toCoordinateFrom: mapView)
            manager.updateCurrentRegion(center: centerCoordinate!, edge: edge)
        case .ended:
            manager.addRegion()
        default:
            break
        }
    }
    
}
