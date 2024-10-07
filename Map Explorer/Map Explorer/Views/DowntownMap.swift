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
    
    
    var body: some View {
        Map(position: $camera, selection:$selectedPlace) {
            //favoriteMarkers
            if manager.showFavorites {
                favoriteAnnotations
            }
            
            places
            UserAnnotation()
        
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
                MapTopControls()
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
            Marker(place.name, systemImage: place.category.systemName, coordinate: place.coordinate)
                .tag(place)
        }
        
    }
    
    
}

#Preview {
    DowntownMap(selectedPlace: .constant(Place.standard))
        .environment(Manager())
}
