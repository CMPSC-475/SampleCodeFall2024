//
//  RootView.swift
//  ColorComponents
//
//  Created by Nader Alfares on 9/9/24.
//

import SwiftUI

enum Showing : String, Identifiable, CaseIterable {
    case preferences, blendedColors
    var id: RawValue { rawValue}
}

struct RootView: View {
    @Environment(ColorManager.self) var manager : ColorManager
    @State private var showing : Showing?
    
    var body: some View {
        @Bindable var manager = manager
        VStack {
            ForEach($manager.components) {$component in
                    ColorShapeView(component: $component)
            }
            Spacer()
            ControlView(showing: $showing)
            
        }
        .sheet(item: $showing, content: { item in
            switch item {
            case .preferences:
                PreferenceView(preferences: $manager.preferences)
            case .blendedColors:
                BlendView(components: manager.components)
            }
                
        })
        
        
    }
}

#Preview {
    RootView()
        .environment(ColorManager())
}
