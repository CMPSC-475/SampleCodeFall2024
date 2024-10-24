//
//  ContentView.swift
//  US States
//
//  Created by Nader Alfares on 3/11/24.
//

import SwiftUI

struct StatesList: View {
    @Environment(StatesManager.self) var manager
    var body: some View {
        @Bindable var manager = manager
        NavigationStack {
            List {
                ForEach(manager.sectionInfo()) { sectionInfo in
                    Section {
                        ForEach($manager.theStates) { state in
                            if sectionInfo.identifiers.contains(state.id) {
                                NavigationLink(destination: StateDetailView(theState: state)) {
                                    StateRow(theState: state)
                                }
                            }
                            
                        }
                    } header : {
                        Text(sectionInfo.title)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    SectionPicker(sectioning: $manager.sectioning)
                }
            }
        }
    }
}


#Preview {
    StatesList()
        .environment(StatesManager())
}
