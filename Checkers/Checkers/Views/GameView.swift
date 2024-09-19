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
        GeometryReader {proxy in
            manager.setBoardWidth(Int(proxy.size.width))
            return VStack {
                Spacer()
                ControlView(showPreference: $showPreference)
                Spacer()
                ZStack(alignment: .topLeading) {
                    BoardView()
                    ForEach($manager.pieces) { $piece in
                        CheckerView(piece: $piece)
                    }
                }
                Spacer()
            }
            
            .sheet(isPresented: $showPreference) {
                PreferenceView(preferences: $manager.preferences)
            }
        }
        
    }
}

#Preview {
    GameView()
        .environment(GameManager())
}
