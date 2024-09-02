//
//  MascotView.swift
//  WeAre
//
//  Created by Nader Alfares on 8/29/24.
//

import SwiftUI

struct MascotView: View {
    var imageName = "Mascot 0"
    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .border(Color.orange, width: 5)
            .frame(width: 300, height: 400)
        
    }
}

#Preview {
    MascotView()
}
