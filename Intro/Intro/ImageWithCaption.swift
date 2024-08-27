//
//  ImageWithCaption.swift
//  Intro
//
//  Created by Nader Alfares on 8/27/24.
//

import SwiftUI

struct ImageWithCaption : View {
    var body: some View {
        Image("Mascot 0")
            .resizable()
            .border(Color.black)
            .overlay(alignment: .bottomTrailing) {
                Text("Penn State Mascot")
                    .bold()
            }
            .aspectRatio(contentMode: .fit)
    }
}

#Preview {
    ImageWithCaption()
}
