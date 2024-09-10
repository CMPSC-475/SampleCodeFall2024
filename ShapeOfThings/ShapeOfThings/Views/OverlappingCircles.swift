//
//  OverlappingCircles.swift
//  ShapeOfThings
//
//  Created by Nader Alfares on 9/10/24.
//

import SwiftUI

struct OverlappingCircles: View {
    
    // Number of circles to display
    let numberOfCircles = 5
    
    // Colors for the circles
    let colors: [Color] = [.blue, .green, .yellow, .red, .purple]
    
    // Radius for the circular pattern
    let radius: CGFloat = 50
    
    var body: some View {
        ZStack {
            ForEach(0..<numberOfCircles, id: \.self) { index in
                Circle()
                    .fill(colors[index % colors.count])
                    .frame(width: radius * 2, height: radius * 2)
                    .offset(x: xOffset(for: index), y: yOffset(for: index))
                    .opacity(0.5)
            }
        }
    }
    
    // Calculate the X offset using cosine
    private func xOffset(for index: Int) -> CGFloat {
        let angle = angleForCircle(at: index)
        return radius * cos(angle)
    }
    
    // Calculate the Y offset using sine
    private func yOffset(for index: Int) -> CGFloat {
        let angle = angleForCircle(at: index)
        return radius * sin(angle)
    }
    
    // Calculate the angle for each circle in radians
    private func angleForCircle(at index: Int) -> CGFloat {
        let anglePerCircle = 2 * CGFloat.pi / CGFloat(numberOfCircles)
        return anglePerCircle * CGFloat(index)
    }
}

#Preview {
    OverlappingCircles()
}
