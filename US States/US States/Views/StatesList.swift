//
//  StatesList.swift
//  US States
//
//  Created by Nader Alfares on 10/19/24.
//

import SwiftUI
struct StatesList: View {
    @Environment(StatesManager.self) var manager
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}
#Preview {
    StatesList()
        .environment(StatesManager())
}
