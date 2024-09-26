//
//  Arc.swift
//  AnimationDemo
//
//  Created by Nader Alfares on 9/23/24.
//

import Foundation
import SwiftUI

struct Arc: Shape {
    var offset: CGFloat
    
    var animatableData: CGFloat {
        get { offset }
        set { offset = newValue }
    }
    
      // Animation for multiple property variables
//    var animatableDimensions: AnimatablePair<CGFloat, CGFloat> {
//        get { .init(offset, offset2) }
//        set { offset = newValue.first; offset2 = newValue.second }
//    }

    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let startPoint = CGPoint(x: rect.minX, y: rect.midY)
        let endPoint = CGPoint(x: rect.maxX, y: rect.midY)
        let controlPoint = CGPoint(x: rect.midX, y: rect.midY - offset)
        path.move(to: startPoint)
        path.addQuadCurve(to: endPoint, control: controlPoint)
        
        return path
    }
}
