//
//  ContentView.swift
//  WeAre
//
//  Created by Nader Alfares on 8/28/24.
//

import SwiftUI

struct MainView: View {
    @Environment(CheerManager.self) var manager
    var body: some View {
        ZStack {
            Color.cyan
            VStack{
                MascotView(imageName: manager.currentCheer.imageName)
                CheerTextView(cheerText: manager.currentCheer.title, isVisible: manager.isFirstCheerVisible)
                CheerTextView(cheerText: manager.currentCheer.title, isVisible: manager.isSecondCheerVisible)
                CheerButtonView(action: manager.cheer)
            }
        }
        .ignoresSafeArea()
    }
}



#Preview {
    MainView()
        .environment(CheerManager())
}
