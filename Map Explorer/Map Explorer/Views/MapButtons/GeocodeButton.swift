//
//  GeocodeButton.swift
//  Map Explorer
//
//  Created by Nader Alfares on 10/7/24.
//
import SwiftUI

struct GeocodeButton: View {
    @Environment(Manager.self) var manager

    var body: some View {
        //TODO: add action for reverse geocoding user's location
        Button(action:{
            manager.geocodeCurrentLocation()
        }){
            Image(systemName: "location.magnifyingglass")
        }
    }
}

#Preview {
    GeocodeButton()
        .environment(Manager())
}
