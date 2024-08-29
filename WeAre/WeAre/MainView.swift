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
                MascotView()
                CheerTextView(cheerText: "We Are", isVisible: cheerManager.isFirstCheerVisible)
                CheerTextView(cheerText: "Penn State", isVisible: cheerManager.isSecondCheerVisible)
                CheerButtonView(action: cheerManager.cheer)

            }
        }
        .ignoresSafeArea()
    }
}

struct SomeExample : View {
    
    
    var body : some View {
        Text("some")
    }
    
}


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
    MainView()
}
