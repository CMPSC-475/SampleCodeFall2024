//
//  SearchButton.swift
//  Map Explorer
//
//  Created by Nader Alfares on 10/3/24.
//
import SwiftUI

struct SearchButton: View {
    @Environment(Manager.self) var manager : Manager
    var body: some View {
        Menu("Categories") {
            ForEach(Category.allCases, id:\.self) {category in
                Button {
                    manager.searchFor(category)
                } label: {
                    Text(category.rawValue)
                }
            }
        }
        
        
    }
}

#Preview {
    SearchButton()
        .environment(Manager())
}

