//
//  ControlView.swift
//  ColorComponents
//
//  Created by Nader Alfares on 9/9/24.
//

import SwiftUI

struct ControlView: View {
    @Environment(ColorManager.self) var manager : ColorManager
    
    @Binding var showing : Showing?
    var body: some View {
        HStack {
            Spacer()
            Button(action: {manager.addColor()}) {
                Image(systemName: "plus.app")
            }
            Spacer()
            Button(action: {manager.deleteLast()}) {
                Image(systemName: "delete.left")
            }
            Spacer()
            Button(action: {manager.clearColors()}) {
                Image(systemName: "eraser")
            }
            Spacer()
            Button(action: {manager.invertColors()}) {
                Image(systemName: "arrow.triangle.swap")
            }
            Spacer()
            Button(action: {
                showing = .blendedColors
            }, label: {
                Image(systemName: "circle.hexagongrid.circle")
            })
            Spacer()
            Button(action: {
                showing = .preferences
            }, label: {
                Image(systemName: "gear")
            })
            Spacer()
        }
    }
}

#Preview {
    ControlView(showing: .constant(.blendedColors))
        .environment(ColorManager())
}
