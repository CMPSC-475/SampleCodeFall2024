//
//  ZoomButton.swift
//  Map Explorer
//
//  Created by Nader Alfares on 10/7/24.
//
import SwiftUI

struct ZoomPlaceButton: View {
    @Environment(Manager.self) var manager
    var body: some View {
        Menu {
            Text("Todo: populate with result places")
        } label: {
            Image(systemName: "mappin")
        }
    }
}

#Preview {
    ZoomPlaceButton()
        .environment(Manager())
}

