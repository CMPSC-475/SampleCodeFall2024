//
//  MaoKindPicker.swift
//  Map Explorer
//
//  Created by Nader Alfares on 10/14/24.
//
import Foundation
import SwiftUI

struct MapKindPicker: View {
    @Binding var mapKind : MapKind
    
    var body: some View {
        
        Menu {
            if mapKind == .SwiftUI {
                Button("UIKit Map") { mapKind = .UIKit}
            } else {
                Button("SwiftUI Map") { mapKind = .SwiftUI}
            }
             } label: {
                Image(systemName: "map")
            }
    }
}
#Preview {
    MapKindPicker(mapKind: .constant(.SwiftUI))
}

