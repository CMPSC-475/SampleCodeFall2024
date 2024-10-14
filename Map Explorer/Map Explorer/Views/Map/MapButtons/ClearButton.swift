//
//  ClearButton.swift
//  Map Explorer
//
//  Created by Nader Alfares on 10/7/24.
//
import SwiftUI

struct ClearButton: View {
    
    @Environment(Manager.self) var manager : Manager
    
    var body: some View {
        Button(action: {manager.clearAll()}) {
            Image(systemName: "clear")
        }
    }
}

#Preview {
    ClearButton()
        .environment(Manager())
}
