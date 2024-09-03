//
//  ContentView.swift
//  WeAre
//
//  Created by Nader Alfares on 8/28/24.
//

import SwiftUI

struct MainView: View {
    @State var cheerManager = CheerManager()
    var body: some View {
        ZStack {
            Color.cyan
            VStack{
                MascotView(imageName: cheerManager.currentCheer.imageName)
                CheerTextView(cheerText: cheerManager.currentCheer.title, isVisible: cheerManager.isFirstCheerVisible)
                CheerTextView(cheerText: cheerManager.currentCheer.title, isVisible: cheerManager.isSecondCheerVisible)
                CheerButtonView(action: cheerManager.cheer)
            }
        }
        .ignoresSafeArea()
    }
}



#Preview {
    MainView()
}
