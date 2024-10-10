//
//  DowntownMap.swift
//  Map Explorer
//
//  Created by Nader Alfares on 10/7/24.
//
import SwiftUI
import MapKit

struct DowntownMap: View {
    @Environment(Manager.self) var manager
    @State private var camera : MapCameraPosition = .automatic
    @Binding var selectedPlace : Place?
    @Binding var interactionMode : MapInteractionModes
    
    var body: some View {

        MapReader { proxy in
        let dragGesture = DragGesture()
            .onChanged { value in
                let centerPoint = value.startLocation
                let edgePoint = value.location
                
                // conversion
                let centerCoordinate = proxy.convert(centerPoint, from: .local)!
                let edgeCoordinate = proxy.convert(edgePoint, from: .local)!
                
                manager.updateCurrentRegion(center: centerCoordinate, edge: edgeCoordinate)
                
            
            }
            .onEnded { value in
                manager.addRegion()
            }
        
        Map(position: $camera,
            interactionModes: interactionMode,
            selection:$selectedPlace) {
            //favoriteMarkers
            if manager.showFavorites {
                favoriteAnnotations
            }
            
            places
            UserAnnotation()
            regions
            if let route = manager.routes.first {
                ForEach(route.steps, id: \.self) { step in
                    MapPolyline(step.polyline)
                        .stroke(.blue, lineWidth: 8)
                }
            }
            
        
        }
            .gesture(dragGesture)
        }
        .onAppear {
            camera = .region(manager.region)
        }
        .onMapCameraChange{ context in
            manager.region = context.region
        }
//        .mapControls{
//            MapCompass()
//            MapPitchToggle()
//        }
        .mapStyle(.standard(pointsOfInterest: [.bank]))
        .safeAreaInset(edge: .top) {
            ZStack {
                Color.white
                MapTopControls(position: $camera, interactionMode: $interactionMode)
            }
            .frame(height: 50)
            .padding()
            .shadow(radius: 20)

        }
    }
}

extension DowntownMap {
    
    var favoriteMarkers : some MapContent {
        ForEach(manager.favorites) { favorite in
            Marker(favorite.title, coordinate: .init(coord: favorite.coord))
                .tint(.cyan)
        }
    }
    
    
    var favoriteAnnotations : some MapContent {
        ForEach(manager.favorites) { favorite in
            Annotation(favorite.title, coordinate:
                    .init(coord: favorite.coord)) {
                
                Button {
//                    selectedFavorite = favorite
                } label: {
                    Image(systemName: "star.fill")
                        .overlay(Image(systemName: "star")
                            .foregroundStyle(.black)
                            .font(.system(size: 35)
                            ))
                        .font(.system(size: 35))
                        .foregroundStyle(.yellow)
                }

            }
        }
        
    }
    
    var places : some MapContent {
        ForEach(manager.places) {
            place in
            Marker(place.name, coordinate: place.coordinate)
                .tag(place)
        }
        
    }
    
    
    var regions : some MapContent {
        Group {
            ForEach(manager.circularRegions) { region in
                MapCircle(center: CLLocationCoordinate2D(coord: region.center), radius: region.radius)
                    .foregroundStyle(Color.black.opacity(0.3))
            }
            
            if let currentRegion = manager.currentCircularRegion {
                MapCircle(center: CLLocationCoordinate2D(coord: currentRegion.center), radius: currentRegion.radius)
                    .foregroundStyle(Color.blue.opacity(0.3))
            }
        }
    }
    
    
    
    
}

#Preview {
    DowntownMap(selectedPlace: .constant(Place.standard), interactionMode: .constant(.all))
        .environment(Manager())
}
