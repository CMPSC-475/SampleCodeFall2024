//
//  MainView.swift
//  Map Explorer
//
//  Created by Nader Alfares on 9/28/24.
//
import SwiftUI
import MapKit

struct MainView: View {
    @Environment(Manager.self) var manager
    
    @State private var selectedPlace : Place?
    @State var interactionMode : MapInteractionModes = .all
    var body: some View {
        @Bindable var manager = manager
        DowntownMap(selectedPlace: $selectedPlace, interactionMode: $interactionMode)
            .sheet(item: $selectedPlace) { selectedPlace in
            PlaceDetailView(place: selectedPlace)
                .presentationDetents([.fraction(0.3)])
        }
            .alert("User's Location", isPresented: $manager.showAlert, actions: {}) {
                Text(manager.showLocationDescription ?? "User's Location not found")
            }

    }
}




#Preview {
    MainView()
        .environment(Manager())

}
