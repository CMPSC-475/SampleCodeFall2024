//
//  WeAreApp.swift
//  WeAre
//
//  Created by Nader Alfares on 8/28/24.
//

import SwiftUI

@main
struct WeAreApp: App {
    @State var cheerManager = CheerManager()
    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(cheerManager)
        }
    }
}
