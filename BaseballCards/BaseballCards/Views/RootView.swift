//
//  RootView.swift
//  BaseballCards
//
//  Created by Nader Alfares on 9/23/24.
//

import SwiftUI

struct RootView: View {
    @Environment(Manager.self) var manager : Manager
    var body: some View {
        VStack {
            
            HStack {
                Score(title: "Traded", count: 0)
                Spacer()
                Button("Reset") {}
                Spacer()
                Score(title: "Kept", count: 0)
            }
            .padding()
        }
    }
}

struct Score : View {
    var title : String
    var count : Int
    var body : some View {
        VStack {
            Text(title)
            Text("\(count)")
        }
    }
}

#Preview {
    RootView()
        .environment(Manager())
}
