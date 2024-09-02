//
//  CheerButtonView.swift
//  WeAre
//
//  Created by Nader Alfares on 9/2/24.
//

import SwiftUI

struct CheerButtonView : View {
    var action : () -> Void
    var body : some View {
        Button(action: action, label: {
            Text("Cheer")
                .bold()
                .padding()
                .foregroundStyle(Color.white)
                .background(
                    RoundedRectangle(cornerRadius: 25.0).foregroundStyle(Color.red)
                )
        })
    }
}

#Preview {
    CheerButtonView(action: {})
}
