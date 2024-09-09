//
//  Manager+Color.swift
//  ColorComponents
//
//  Created by Nader Alfares on 9/9/24.
//

import Foundation
import SwiftUI

//Convenience function to convert model data to view Color
extension ColorManager {
    func colorForComponent(_ component:ColorComponent) -> Color {
        let color = Color(red: component.red, green: component.green, blue: component.blue)
        return color
    }
}
