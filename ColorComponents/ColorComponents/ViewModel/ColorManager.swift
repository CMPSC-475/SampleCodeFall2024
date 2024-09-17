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
    let persistence : StorageManager = StorageManager<[ColorComponent]>(filename: "colors")
    
    var selectedComponent : ColorComponent = ColorComponent()
    
    init() {
        components = persistence.modelData ?? []
    }
    
    
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
    
    
    func save() {
        persistence.save(components: components)
    }
    
}

