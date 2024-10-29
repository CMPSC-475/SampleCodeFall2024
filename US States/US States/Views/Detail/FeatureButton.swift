//
//  FeatureButton.swift
//  US States
//
//  Created by Nader Alfares on 3/13/24.
//

import SwiftUI

struct FeatureButton: View {
    @Binding var value : Bool
    @Environment(\.dismiss) var dismiss
    let iconName : String
    var body: some View {
        return Button(action:{value.toggle(); dismiss()}) {
            Image(systemName: value ? iconName+".fill" : iconName)
        }
    }
}

#Preview {
    FeatureButton(value: .constant(true), iconName: "car")
}
