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
            RootView()
                .environment(manager)
                .onChange(of: scenePhase) { oldValue, newValue in
                    switch newValue {
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
