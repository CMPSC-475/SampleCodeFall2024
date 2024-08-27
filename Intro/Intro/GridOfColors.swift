//
//  GridOfColors.swift
//  Intro
//
//  Created by Nader Alfares on 8/27/24.
//

import SwiftUI

struct GridOfColors: View {
    
    var cols : Int = 4
    var rows : Int = 6
    
    var body: some View {
        
        ForEach(1...rows, id: \.self) { colIndex in
            HStack {
                ForEach(1...cols, id: \.self) { rosIndex in
                    Rectangle()
                        .foregroundStyle(RandomColor())
                }
            }
            
        }
    }
    
    
    func RandomColor() -> Color {
        Color (cgColor: CGColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1.0))
    }
}

#Preview {
    GridOfColors()
}
