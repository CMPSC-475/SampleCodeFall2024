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
            .border(Color.orange, width: 5)
    }
}

#Preview {
    MascotView()
}
