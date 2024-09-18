//
//  CheckersApp.swift
//  Checkers
//
//  Created by Nader Alfares on 9/18/24.
//

import SwiftUI

@main
struct CheckersApp: App {
    @State var gameManager = GameManager()
    var body: some Scene {
        WindowGroup {
            GameView()
                .environment(gameManager)
        }
    }
}
