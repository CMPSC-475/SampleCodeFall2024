//
//  MapSelectionView.swift
//  Map Explorer
//
//  Created by Nader Alfares on 10/14/24.
//


import SwiftUI
import MapKit

struct MapSelectionView: View {
    @Environment(Manager.self) var manager : Manager
    @Binding var camera : MapCameraPosition
    @Binding var mapKind : MapKind
    @Binding var modes : MapInteractionModes
    
    var body : some View {
        @Bindable var manager = manager
        switch mapKind {
        case .SwiftUI:
            DowntownMap(camera: $camera, selectedPlace: $manager.selectedPlace, interactionMode: $modes)

        case .UIKit:
            MapViewUIKit(mode: $modes)
                .ignoresSafeArea()
        }
    }
}

#Preview {
    MapSelectionView(camera: .constant(.automatic), mapKind: .constant(.UIKit), modes: .constant(.all))
        .environment(Manager())
}
