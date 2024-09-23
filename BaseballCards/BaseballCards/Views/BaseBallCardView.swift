//
//  BaseBallCardView.swift
//  BaseballCards
//
//  Created by Nader Alfares on 9/23/24.
//
import SwiftUI

struct BaseballCardView: View {
    @Environment(Manager.self) var manager

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    BaseballCardView()
        .environment(Manager())
}
