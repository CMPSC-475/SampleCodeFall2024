//
//  MapTopControls.swift
//  Map Explorer
//
//  Created by Nader Alfares on 10/7/24.
//
import SwiftUI

struct MapTopControls: View {
    @Environment(Manager.self) var manager

    var body: some View {
        HStack(spacing:20) {
            Button(action: {manager.toggleFavorites()}) {
                Image(systemName: manager.showFavorites ? "star.fill" : "star")
            }
            SearchButton()
            ZoomPlaceButton()
            DiningButton()
            MapInteractionButton()
            GeocodeButton().padding(.trailing)
            Spacer()
            ClearButton()
        }
        .padding(.horizontal)
    }
}

#Preview {
    MapTopControls()
        .environment(Manager())
}
