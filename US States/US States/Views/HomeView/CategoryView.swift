//
//  CategoryView.swift
//  US States
//
//  Created by Nader Alfares on 10/29/24.
//
import SwiftUI

struct CategoryView: View {
    @Environment(StatesManager.self) var manager
    let category : Category
    var body: some View {
        @Bindable var manager = manager
        VStack {
            HStack {
                Text("\(category.title)")
                    .bold()
                    .font(.title2)
                Spacer()
            }
            ScrollView(.horizontal) {
                HStack {
                    ForEach($manager.theStates) { $theState in
                        if category.property(theState) {
                            NavigationLink {
                                StateDetailView(theState: $theState)
                            } label: {
                                StateCardView(theState: theState)
                            }

                            
                        }
                    }
                }
                
                
            }
        }
    }
}
