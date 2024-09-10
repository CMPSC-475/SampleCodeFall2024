//
//  Sector.swift
//  ShapeOfThings
//
//  Created by Nader Alfares on 9/9/24.
//

import Foundation
import SwiftUI

struct Sector : Shape {
    var startAngle : CGFloat    //radians
    var endAngle : CGFloat      //radians
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let w = rect.size.width
        let h = rect.size.height
        
        let center = CGPoint(x: w/2, y: h/2)
        let radius = min(w, h)/2.0
        
        path.move(to: center)
        let point1 = CGPoint(x: center.x + radius * cos(startAngle), y: center.y + radius * sin(startAngle))
        
        path.addLine(to: point1)
        path.addArc(center: center, radius: radius, startAngle: Angle(radians: startAngle), endAngle: Angle(radians: endAngle), clockwise: true)
        
        path.closeSubpath()
        
            
        return path
    }
}

#Preview {
    Sector(startAngle: CGFloat.zero, endAngle: CGFloat.pi/2)
        .border(Color.black)
}

