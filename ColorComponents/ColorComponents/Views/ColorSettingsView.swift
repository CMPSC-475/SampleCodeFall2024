//
//  ColorSettingsView.swift
//  ColorComponents
//
//  Created by Nader Alfares on 9/12/24.
//

import SwiftUI

struct ColorSettingsView: View {
    @Binding var component : ColorComponent
    var body: some View {
        Form {
            Slider(value: $component.red, in: 0...1) {
                Text("Red")
            } minimumValueLabel: {
                Text("0")
            } maximumValueLabel: {
                Text("1")
            }
            
            Slider(value: $component.green, in: 0...1) {
                Text("Green")
            } minimumValueLabel: {
                Text("0")
            } maximumValueLabel: {
                Text("1")
            }
            
            Slider(value: $component.blue, in: 0...1) {
                Text("Blue")
            } minimumValueLabel: {
                Text("0")
            } maximumValueLabel: {
                Text("1")
            }

        }
    }
}

#Preview {
    ColorSettingsView(component: .constant(ColorComponent.standard))
}
