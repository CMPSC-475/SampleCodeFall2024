//
//  CheerTextView.swift
//  WeAre
//
//  Created by Nader Alfares on 8/29/24.
//

import SwiftUI

struct CheerTextView: View {
    var cheerText = "Cheer Text"
    var isVisible : Bool = true
    var body: some View {
        Text(cheerText)
            .bold()
            .font(.title)
            .foregroundStyle(Color.white)
            .opacity(isVisible ? 1.0 : 0)
    }
}

#Preview {
    ZStack {
        Color.cyan
        CheerTextView(cheerText: "Cheer Text")
    }
}
