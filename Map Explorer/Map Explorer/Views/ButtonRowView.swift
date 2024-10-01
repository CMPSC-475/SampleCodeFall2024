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


    var body: some View {
        HStack {
            NavigationLink(destination: Text("TODO: details of the place")) {
                Image(systemName: "location.fill")
            }
            ActionButton(title: "Route", icon: "figure.walk", action: {dismiss()})
            ActionButton(title: "Call", icon: "phone", action: {})
            ActionButton(title: "Website", icon: "safari", action: {})
            ActionButton(title: "More", icon: "ellipsis", action: {})
        }.font(.subheadline)
    }
}

#Preview {
    ButtonRow()
        .environment(Manager())
}
