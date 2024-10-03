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
    @Environment(Manager.self) var manager : Manager

    @State var camera : MapCameraPosition = .automatic
    @State var selectedFavorite : Favorite?
    var body: some View {
        
        NavigationStack {
            Map(position:$camera) {
                //            Marker(coordinate: .stateCollege) {
                //                Image(systemName: "star.fill")
                //            }
                //            .tint(.orange)
                if (manager.showFavorites) {
                    favoriteAnnotations
                }
                
                
//                MapCircle(center: .stateCollege, radius: 1000)
//                    .foregroundStyle(.blue.opacity(0.5))
                
                places
                
                UserAnnotation()
                
            }
            .mapStyle(.standard)
            .onAppear {
                camera = .region(manager.region)
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    SearchButton()
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        manager.showFavorites.toggle()
                    } label : {
                        Image(systemName: manager.showFavorites ? "star.fill" : "star")
                    }
                }
            }
            .sheet(item: $selectedFavorite) { selectedFav in
                PlaceDetailView(place: selectedFav)
                    .presentationDetents([.fraction(0.3)])
            }
            
        }
    }
}



extension MainView {
    
    var favoriteAnnotations : some MapContent {
        ForEach(manager.favorites) { favorite in
            Annotation(favorite.title, coordinate:
                    .init(coord: favorite.coord)) {
                
                Button {
                    selectedFavorite = favorite
                } label: {
                    Image(systemName: "star.fill")
                        .font(.system(size: 35))
                        .foregroundStyle(.yellow)
                        .overlay(
                            Image(systemName: "star")
                                .font(.system(size: 35))
                                .foregroundColor(.black)
                        )
                        
                }
            }
        }
        
    }
    
    var places : some MapContent {
        ForEach(manager.places) { place in
            Marker(place.name, systemImage: place.category.systemName, coordinate: place.coordinate)
        }
    }
}

#Preview {
    MainView()
        .environment(Manager())

}
