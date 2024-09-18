//
//  GameView.swift
//  Checkers
//
//  Created by Nader Alfares on 9/18/24.
//

import SwiftUI

struct GameView: View {
    @Environment(GameManager.self) var manager
    @State var showPreference = false
    var body: some View {
        @Bindable var manager = manager
        VStack {
            ControlView(showPreference: $showPreference)
            Spacer()
            BoardView()
            Spacer()
        }
        .sheet(isPresented: $showPreference) {
            PreferenceView(preferences: $manager.preferences)
        }
    }
}
#Preview {
    GameView()
        .environment(GameManager())
}
