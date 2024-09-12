//
//  Preferences.swift
//  ColorComponents
//
//  Created by Nader Alfares on 9/12/24.
//

import Foundation

enum ColorShape : String, CaseIterable, Identifiable {
    case rectangle, circle, triangle, diamond
    var id : RawValue {rawValue}
}

struct Preferences {
    var colorShape : ColorShape = .rectangle
}
