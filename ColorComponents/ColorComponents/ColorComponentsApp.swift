//
//  ColorComponentsApp.swift
//  ColorComponents
//
//  Created by Nader Alfares on 9/9/24.
//

import SwiftUI

@main
struct ColorComponentsApp: App {
    @State var colorManager : ColorManager = ColorManager()
    var body: some Scene {
        WindowGroup {
            RootView()
                .environment(colorManager)
        }
    }
}
