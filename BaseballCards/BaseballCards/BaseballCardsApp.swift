//
//  BaseballCardsApp.swift
//  BaseballCards
//
//  Created by Nader Alfares on 2/6/24.
//

import SwiftUI

@main
struct BaseballCardsApp: App {
    @State var manager : Manager = Manager()
    var body: some Scene {
        WindowGroup {
            RootView()
                .environment(manager)
        }
    }
}
