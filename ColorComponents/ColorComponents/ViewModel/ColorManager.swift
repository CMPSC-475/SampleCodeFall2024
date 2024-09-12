//
//  ColorManager.swift
//  ColorComponents
//
//  Created by Nader Alfares on 9/9/24.
//

import Foundation
import SwiftUI

@Observable
class ColorManager {

    var components : [ColorComponent] = []
    var preferences : Preferences = Preferences()
    
    var selectedComponent : ColorComponent = ColorComponent()
    
    func addColor() {
        components.append(ColorComponent())
    }
    
    func deleteLast() {
        components.removeLast()
    }
    
    func clearColors() {
        components.removeAll()
    }
    
    func invertColors() {
        let newComponents = components.map { c in
            c.invert
        }
        components = newComponents
    }
    
}

