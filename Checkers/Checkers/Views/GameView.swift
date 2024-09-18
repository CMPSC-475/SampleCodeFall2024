//
//  GameView.swift
//  Checkers
//
//  Created by Nader Alfares on 9/18/24.
//

import SwiftUI

struct GameView: View {
    @EnvironmentObject var manager:GameManager
    @State var showPreference = false
    var body: some View {
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
        .environmentObject(GameManager())
}
