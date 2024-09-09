//
//  ContentView.swift
//  ShapeOfThings
//
//  Created by Nader Alfares on 9/9/24.
//

import SwiftUI

struct RootView: View {
    var body: some View {
        VStack {
            Diamond()
            Triangle()
            Sector(startAngle: CGFloat.zero, endAngle: CGFloat.pi)
        }
        .padding()
    }
}

#Preview {
    RootView()
}
