//
//  ColorComponentsApp.swift
//  ColorComponents
//
//  Created by Nader Alfares on 9/9/24.
//

import SwiftUI

@main
struct ColorComponentsApp: App {
    @Environment(\.scenePhase) var scenePhase
    @State var colorManager : ColorManager = ColorManager()
    var body: some Scene {
        WindowGroup {
            RootView()
                .environment(colorManager)
                .onChange(of: scenePhase) { oldValue, newValue in
                    switch newValue {
                    case .background, .active:
                        colorManager.save()
                    default:
                        break
                    }
                }
        }
    }
}
