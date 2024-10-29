//
//  StateCardView.swift
//  US States
//
//  Created by Nader Alfares on 10/29/24.
//
import SwiftUI

struct StateCardView: View {
    let theState : USState
    var body: some View {
        Image(theState.name)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: 60)
    }
}

#Preview {
    StateCardView(theState: USState.standard)
}
