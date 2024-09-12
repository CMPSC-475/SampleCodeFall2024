//
//  ColorShapeView.swift
//  ColorComponents
//
//  Created by Nader Alfares on 9/9/24.
//

import SwiftUI

struct ColorShapeView: View {
    @Environment(ColorManager.self) var manager : ColorManager
    @Binding var component: ColorComponent
    @State var showColorSheet = false
    var body: some View {
        
        Button(action: {showColorSheet = true}) {
            switch manager.preferences.colorShape {
            case .rectangle:
                RoundedRectangle(cornerRadius: 10)
                    .fill(manager.colorForComponent(component))
            case .circle:
                Circle()
                    .fill(manager.colorForComponent(component))
            case .triangle:
                Triangle()
                    .fill(manager.colorForComponent(component))
            case .diamond:
                Diamond()
                    .fill(manager.colorForComponent(component))
            }
        }
        .sheet(isPresented: $showColorSheet, content: {
            ColorSettingsView(component: $component)
        })

    }
}


#Preview {
    ColorShapeView(component: .constant(ColorComponent.standard))
        .environment(ColorManager())
}
