//
//  RedCorners.swift
//  Intro
//
//  Created by Nader Alfares on 8/27/24.
//

import SwiftUI


struct HRedCorners : View {
    var squareSize : CGFloat = 100
    var body : some View {
        HStack {
            Rectangle()
                .frame(width: squareSize, height: squareSize)
                .foregroundStyle(Color.red)
            Spacer()
            Rectangle()
                .frame(width: squareSize, height: squareSize)
                .foregroundStyle(Color.red)
            
        }
    }
    
}

struct RedCorners : View {
    var body: some View {
        VStack {
            HRedCorners(squareSize: 150)
            Spacer()
            HRedCorners()
        }
        
    }
}

#Preview {
    RedCorners()
}
