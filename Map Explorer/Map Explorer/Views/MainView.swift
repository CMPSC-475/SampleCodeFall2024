//
//  MainView.swift
//  Map Explorer
//
//  Created by Nader Alfares on 9/28/24.
//
import SwiftUI
import MapKit

extension CLLocationCoordinate2D {
    static let stateCollege = CLLocationCoordinate2D(latitude: 40.79550030, longitude: -77.85900170)
    
    init(coord: Coord) {
        self = CLLocationCoordinate2D(latitude: coord.latitude, longitude: coord.longitude)
    }
    
}

struct MainView: View {
    @Environment(Manager.self) var manager
    
    @State private var camera : MapCameraPosition = .automatic
    
    @State var selectedFavorite : Favorite?

    var body: some View {
        
        Map(position: $camera) {
            //favoriteMarkers
            if manager.showFavorites {
                favoriteAnnotations
            }
            
            places
        
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
        .sheet(item: $selectedFavorite) { selectedFav in
            PlaceDetailView(place: selectedFav)
                .presentationDetents([.fraction(0.3)])
        }

    }
}

extension MainView {
    
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
                    selectedFavorite = favorite
                } label: {
                    Image(systemName: "mappin")
                        .font(.system(size: 35))
                        .foregroundStyle(.red)
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
    MainView()
        .environment(Manager())

}
