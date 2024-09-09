//
//  ColorShapeView.swift
//  ColorComponents
//
//  Created by Nader Alfares on 9/9/24.
//

import SwiftUI

struct ColorShapeView: View {
    @Environment(ColorManager.self) var manager : ColorManager
    let component: ColorComponent
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(manager.colorForComponent(component))
    }
}


#Preview {
    ColorShapeView(component: ColorComponent.standard)
        .environment(ColorManager())
}
