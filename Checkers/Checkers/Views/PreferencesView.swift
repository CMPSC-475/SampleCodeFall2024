//
//  PreferencesView.swift
//  Checkers
//
//  Created by Nader Alfares on 9/18/24.
//

import SwiftUI

struct PreferenceView: View {
    @Binding var preferences : Preferences
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Form {
            Section("Board Size") {
                Picker("Choose", selection: $preferences.boardDimension) {
                    ForEach(preferences.boardRange, id:\.self) {
                        Text("\($0)")
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
