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

        return path
    }
}

#Preview {
    Sector(startAngle: CGFloat.zero, endAngle: CGFloat.pi/2)
}

