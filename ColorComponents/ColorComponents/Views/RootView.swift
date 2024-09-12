//
//  RootView.swift
//  ColorComponents
//
//  Created by Nader Alfares on 9/9/24.
//

import SwiftUI

struct RootView: View {
    @Environment(ColorManager.self) var manager : ColorManager
    
    @State var showSheet : Bool = false
    var body: some View {
        VStack {
            ForEach(manager.components) {component in
                ColorShapeView(component: component)
            }
            Spacer()
            ControlView()
            Button("show sheet") {
                showSheet.toggle()
            }
        }
        .sheet(isPresented: $showSheet, content: {
            Text("TODO: Edit the colors")
        })
    }
}

#Preview {
    RootView()
        .environment(ColorManager())
}
