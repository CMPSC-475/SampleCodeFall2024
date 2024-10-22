//
//  US_StatesApp.swift
//  US States
//
//  Created by Nader Alfares on 10/19/24.
//

import SwiftUI

@main
struct US_StatesApp: App {
    @State var manager : StatesManager = .init()
    @Environment(\.scenePhase) var scenePhase
    var body: some Scene {
        WindowGroup {
            StatesList()
                .environment(manager)
                .onChange(of: scenePhase) { phase in
                    switch phase {
                    case .active, .background:
                        manager.save()
                    case .inactive:
                        manager.save()
                    default:
                        break
                    }
                }
        }
    }
}
