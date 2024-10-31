//
//  EasySplitView.swift
//  US States
//
//  Created by Nader Alfares on 10/31/24.
//
import SwiftUI

//TODO: 
struct EasySplitView : View {
    @Environment(StatesManager.self) var manager
    
    var body: some View {
        NavigationSplitView {
            StatesList()
        } detail: {
            Text("Select a State")
        }
    }
}

#Preview {
    EasySplitView()
        .environment(StatesManager())
}

