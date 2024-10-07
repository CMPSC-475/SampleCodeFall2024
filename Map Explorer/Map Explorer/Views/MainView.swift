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

    var body: some View {
        
        DowntownMap(selectedPlace: $selectedPlace)
            .sheet(item: $selectedPlace) { selectedPlace in
            PlaceDetailView(place: selectedPlace)
                .presentationDetents([.fraction(0.3)])
        }

    }
}




#Preview {
    MainView()
        .environment(Manager())

}
