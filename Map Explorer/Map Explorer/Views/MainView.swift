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
                
                
                MapCircle(center: .stateCollege, radius: 1000)
                    .foregroundStyle(.blue.opacity(0.5))
                
            }
            .mapStyle(.standard)
            .onAppear {
                camera = .region(MKCoordinateRegion(center: .stateCollege, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)))
            }
            .safeAreaInset(edge: .bottom) {
                HStack {
                    Button {
                        manager.showFavorites.toggle()
                    } label : {
                        Image(systemName: manager.showFavorites ? "star.fill" : "star")
                    }
                    
                    NavigationLink(destination: Text("some details view ")) {
                        Text("click me")
                    }
                }
                
            }
            .sheet(item: $selectedFavorite) { selectedFav in
                PlaceDetailView(place: selectedFav)
            }
            
        }
    }
}



extension MainView {
    
    var favoriteAnnotations : some MapContent {
        
        ForEach(manager.favorites) { favorite in
            Annotation(favorite.title, coordinate: .init(coord: favorite.coord)) {
                Button {
                    selectedFavorite = favorite
                } label : {
                    Image(systemName: "mappin")
                        .font(.system(size: 35))
                        .foregroundStyle(.red)
                }
            }
        }
    }
}

#Preview {
    MainView()
        .environment(Manager())

}
