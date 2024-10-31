//
//  GridView.swift
//  US States
//
//  Created by Nader Alfares on 10/31/24.
//
import SwiftUI

//TODO: -
struct StateGridView : View {
    @Environment(StatesManager.self) var manager
    let columns: [GridItem] = [GridItem(.adaptive(minimum: Flag.height * 2))]
    var body: some View {
        @Bindable var manager = manager
        NavigationStack {
            ScrollView {
                
            
            LazyVGrid(columns: columns) {
                ForEach(manager.sectionInfo(for: .byDecade)) { sectionInfo in
                    Section {
                        ForEach($manager.theStates) { $aState in
                            if sectionInfo.identifiers.contains(aState.id) {
                                NavigationLink(destination: StateDetailView(theState: $aState)) {
                                    StateCardView(theState: aState)
                                }
                            }
                            
                        }
                    } header : {
                        Text(sectionInfo.title)
                    }
                }
            }
                
            }
        }
    }
}

#Preview {
    StateGridView()
        .environment(StatesManager())
}

