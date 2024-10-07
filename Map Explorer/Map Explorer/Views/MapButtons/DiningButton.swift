//
//  DiningButton.swift
//  Map Explorer
//
//  Created by Nader Alfares on 10/7/24.
//
import SwiftUI

struct DiningButton: View {
    @Environment(Manager.self) var manager
    
    var body: some View {
        Menu {
            Text("Show list of restaurants")
        } label: {
            Image(systemName: "fork.knife")
        }
    }
}

#Preview {
    DiningButton()
        .environment(Manager())
}
