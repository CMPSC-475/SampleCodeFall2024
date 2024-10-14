//
//  ZoomButton.swift
//  Map Explorer
//
//  Created by Nader Alfares on 10/7/24.
//
import SwiftUI
import MapKit

struct ZoomPlaceButton: View {
    @Environment(Manager.self) var manager
    @Binding var position : MapCameraPosition
    var body: some View {
        Menu {
            ForEach(manager.places, id: \.self) { place in
                Button {
                    position = .item(place.mapItem)
                } label: {
                    Text(place.name)
                }
                
            }
        } label: {
            Image(systemName: "mappin")
        }
    }
}

#Preview {
    ZoomPlaceButton(position: .constant(.automatic))
        .environment(Manager())
}

