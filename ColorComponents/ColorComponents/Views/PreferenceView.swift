//
//  PreferenceView.swift
//  ColorComponents
//
//  Created by Nader Alfares on 9/12/24.
//

import SwiftUI

struct PreferenceView: View {
    @Binding var preferences : Preferences
    @Environment(\.dismiss) var dismiss
    var body: some View {
        Form {
            Section("Color Shapes") {
                Picker("Choose Shape", selection: $preferences.colorShape) {
                    ForEach(ColorShape.allCases) {
                        
                        Text($0.rawValue.capitalized)
                            .tag($0)
                    }
                }.pickerStyle(.segmented)
            }
            Button("Dismiss") {
                dismiss()
            }
        }

    }
}

#Preview {
    PreferenceView(preferences: .constant(Preferences()))
}
