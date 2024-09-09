//
//  RootView.swift
//  ColorComponents
//
//  Created by Nader Alfares on 9/9/24.
//

import SwiftUI

struct RootView: View {
    @Environment(ColorManager.self) var manager : ColorManager
    var body: some View {
        VStack {
            ForEach(manager.components) {component in
                ColorShapeView(component: component)
            }
            Spacer()
            ControlView()
        }
    }
}

#Preview {
    RootView()
        .environment(ColorManager())
}
