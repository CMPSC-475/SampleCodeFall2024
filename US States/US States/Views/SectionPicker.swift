//
//  SectionPicker.swift
//  US States
//
//  Created by Nader Alfares on 3/13/24.
//

import SwiftUI

struct SectionPicker: View {

    @Environment(StatesManager.self) var manager
    @Binding var sectioning: Sectioning
    
    var body: some View {
        @Bindable var manager = manager
        Picker("Sectioning", selection: $sectioning) {
            ForEach(Sectioning.allCases, id:\.self) {
                Text($0.rawValue)
                    .tag($0)
            }
        }
    }
}

#Preview {
    SectionPicker(sectioning: .constant(.byName))
        .environment(StatesManager())
}
