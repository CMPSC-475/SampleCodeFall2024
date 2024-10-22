//
//  StatesList.swift
//  US States
//
//  Created by Nader Alfares on 10/19/24.
//

import SwiftUI
struct StatesList: View {
    @Environment(StatesManager.self) var manager

    var body: some View {
        @Bindable var manager = manager
        
        NavigationStack {
            List {
                ForEach(manager.sectionInfo()) { sectionInfo in
                    Section(sectionInfo.title) {
                        ForEach ($manager.theStates) { $state in
                            if sectionInfo.identifiers.contains(state.id) {
                                StateRow(aState:
                                            $state)
                            }
                        }
                    }
                }
            }
            .navigationTitle("States")
        }
    }
}

struct StateRow : View {
    @Binding var aState : USState
    var body: some View {
        HStack {
            Text(aState.name)
            Button {
                aState.favorite.toggle()
            } label : {
                Image(systemName: aState.favorite ? "star.fill" : "star")
            }
        }
    }
}

struct StateDetailView : View {
    @Binding var aState : USState
    var body : some View {
        VStack {
            Text(aState.name)
            Button {
                aState.favorite.toggle()
            } label : {
                Image(systemName: aState.favorite ? "star.fill" : "star")
            }
        }
        .navigationTitle(aState.name)
    }
}



#Preview {
    StatesList()
        .environment(StatesManager())
}
