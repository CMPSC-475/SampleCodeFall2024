//
//  OffsetAndPositionExampleView.swift
//  ShapeOfThings
//
//  Created by Nader Alfares on 9/10/24.
//

import SwiftUI

struct OffsetAndPositionExampleView: View {
    
    let xValue : CGFloat = 50
    let yValue : CGFloat = 50
    var body: some View {
        VStack() {
            
            Text("Offset Example")
                .font(.title)
            
            // Circle using offset modifier
            ZStack {
                Color.gray
                    .frame(width: 200, height: 200) // Gray background to see the area
                Circle()
                    .fill(Color.blue)
                    .frame(width: 50, height: 50)
                    
                    .offset(x: xValue, y: yValue) // Moves the circle by (50, 50) relative to its original position
                Text("This circle is offset")
                    .foregroundColor(.white)
            }
            
            Text("Position Example")
                .font(.title)
            
            // Circle using position modifier
            ZStack {
                Color.gray
                    .frame(width: 200, height: 200) // Gray background to see the area
                Circle()
                    .fill(Color.red)
                    .frame(width: 50, height: 50)
                    .position(x: xValue, y: yValue) // Moves the circle to (50, 50) in the parent coordinate system
                    
                Text("This circle is positioned")
                    .foregroundColor(.white)
            }
            
            Text("GeometryReader Example")
                            .font(.title)
                        
            // Circle using GeometryReader for dynamic placement
            GeometryReader { geometry in
                ZStack {
                    Color.gray
                        .frame(width: geometry.size.width, height: 200)
                    
                    // Circle dynamically placed based on GeometryReader's size
                    Circle()
                        .fill(Color.green)
                        .frame(width: 50, height: 50)
                        .position(x: geometry.size.width * 0.25, y: 100) // 25% from left, vertically centered
                    
                    Circle()
                        .fill(Color.orange)
                        .frame(width: 50, height: 50)
                        .position(x: geometry.size.width * 0.5, y: 100) // 75% from left, vertically centered
                    
                    Text("Circles positioned using GeometryReader")
                        .foregroundColor(.white)
                        .position(x: geometry.size.width / 2, y: 150)
                }
            }
            .frame(height: 200) // Fixing height for GeometryReader example
            
        }
    }
}

#Preview {
    OffsetAndPositionExampleView()
}
