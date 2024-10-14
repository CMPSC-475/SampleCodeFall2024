//
//  MapTopControls.swift
//  Map Explorer
//
//  Created by Nader Alfares on 10/7/24.
//
import SwiftUI
import MapKit

struct MapTopControls: View {
    @Environment(Manager.self) var manager
    @Binding var position : MapCameraPosition
    @Binding var interactionMode : MapInteractionModes
    @Binding var mapKind : MapKind
    var body: some View {
        HStack(spacing:20) {
            Button(action: {manager.toggleFavorites()}) {
                Image(systemName: manager.showFavorites ? "star.fill" : "star")
            }
            SearchButton()
            ZoomPlaceButton(position: $position)
            DiningButton()
            MapInteractionButton(interactionMode: $interactionMode)
            GeocodeButton().padding(.trailing)
            MapKindPicker(mapKind: $mapKind)
            Spacer()
            ClearButton()
        }
        .padding(.horizontal)
    }
}

#Preview {
    MapTopControls(position: .constant(.automatic), interactionMode: .constant(.all), mapKind: .constant(.SwiftUI))
        .environment(Manager())
}
