//
//  MainView.swift
//  Map Explorer
//
//  Created by Nader Alfares on 9/28/24.
//
import SwiftUI
import MapKit

enum MapKind {
    case SwiftUI, UIKit
}

struct MainView: View {
    @Environment(Manager.self) var manager
    
    @State private var selectedPlace : Place?
    @State var interactionMode : MapInteractionModes = .all
    @State var camera : MapCameraPosition = .automatic
    @State var mapKind : MapKind = .SwiftUI
    
    var body: some View {
        @Bindable var manager = manager
        MapSelectionView(camera: $camera, mapKind: $mapKind, modes: $interactionMode, selectedPlace: $selectedPlace)
                    .sheet(item: $selectedPlace) { selectedPlace in
                    PlaceDetailView(place: selectedPlace)
                        .presentationDetents([.fraction(0.3)])
                    }
                    .alert("User's Location", isPresented: $manager.showAlert, actions: {}) {
                        Text(manager.showLocationDescription ?? "No Location Found")
                    }
                    .safeAreaInset(edge: .bottom) {
                        ZStack {
                            Color.white
                            MapTopControls(position: $camera, interactionMode: $interactionMode, mapKind: $mapKind)
                        }
                        .frame(height: 50)
                        .padding()
                        .shadow(radius: 20)
                    }

    }
}




#Preview {
    MainView()
        .environment(Manager())

}
