//
//  ButtonRowView.swift
//  Map Explorer
//
//  Created by Nader Alfares on 9/28/24.
//
import SwiftUI

struct ButtonRow: View {
    @Environment(Manager.self) var manager : Manager
    @Environment(\.dismiss) var dismiss

    let place : Place

    var body: some View {
        HStack {
            ActionButton(title: "Route", icon: "figure.walk", action: {
                manager.provideDirections(for:place)
                dismiss()
            })
            ActionButton(title: "Call", icon: "phone", action: {})
            ActionButton(title: "Website", icon: "safari", action: {})
            ActionButton(title: "More", icon: "ellipsis", action: {})
        }.font(.subheadline)
    }
}

#Preview {
    ButtonRow(place: Place.standard)
        .environment(Manager())
}
