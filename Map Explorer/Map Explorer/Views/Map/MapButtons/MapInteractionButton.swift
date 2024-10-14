//
//  MapInteractionButton.swift
//  Map Explorer
//
//  Created by Nader Alfares on 10/7/24.
//
import SwiftUI
import MapKit

struct MapInteractionButton: View {
    @Binding var interactionMode : MapInteractionModes
    var body: some View {
        Button(action:{
            interactionMode = interactionMode == .all ? .zoom : .all
        }) {
            Image(systemName: interactionMode == .all ? "hand.draw" : "hand.draw.fill")
        }
    }
}

#Preview {
    MapInteractionButton(interactionMode: .constant(.all))
}
