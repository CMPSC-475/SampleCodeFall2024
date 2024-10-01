//
//  Map_ExplorerApp.swift
//  Map Explorer
//
//  Created by Nader Alfares on 9/28/24.
//

import SwiftUI

@main
struct Map_ExplorerApp: App {
    @State var manager = Manager()
    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(manager)
        }
    }
}
