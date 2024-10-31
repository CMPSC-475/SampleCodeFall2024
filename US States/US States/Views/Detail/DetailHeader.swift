//
//  DetailHeader.swift
//  US States
//
//  Created by Nader Alfares on 3/13/24.
//

import SwiftUI

struct DetailHeader: View {
    @Environment(StatesManager.self) var manager
    @Binding var theState : USState
    @AppStorage(Storage.homeStateId) var homeStateId : String?
    var isFilled : Bool {
        homeStateId == theState.id
    }
    
    var body : some View {
        HStack(alignment: .center) {
            Text("Founded: \(manager.formatted(year: theState.admissionYear))")
            Spacer()
            Button {
                homeStateId = theState.id
            } label: {
                Image(systemName: isFilled ? "house.fill" : "house")
            }
            FeatureButton(value: $theState.visited, iconName: Icons.visited )
            FeatureButton(value: $theState.favorite, iconName: Icons.favorite)
            
        }
    }
}

#Preview {
    DetailHeader(theState: .constant(USState.standard))
        .environment(StatesManager())
}
