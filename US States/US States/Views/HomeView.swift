//
//  HomeView.swift
//  US States
//
//  Created by Nader Alfares on 10/29/24.
//
import SwiftUI


struct HomeView : View {
    @Environment(StatesManager.self) var manager
    @AppStorage(Storage.homeStateId) var homeStateId : String?

    var anyVisited : Bool {
        !(manager.theStates.filter {$0.visited}.isEmpty)
    }
    
    var anyFavorited : Bool {
        !(manager.theStates.filter {$0.favorite}.isEmpty)
    }
    
    var body: some View {
        
        NavigationStack {
            List {
                
                if anyVisited {
                    CategoryView(category: Category(title: "Visited States", property: {$0.visited}))
                }
                
                if anyFavorited {
                    CategoryView(category: Category(title: "Favorited States", property: {$0.favorite}))
                }
                
                ForEach(manager.centuries, id:\.self) { century in
                    //TODO: - add states for century
                    CategoryView(category: Category(title: manager.centuryTitle(for: century), property: {$0.centuryFounded == century}))
                }
                
            }
        }
    }
}


#Preview {
    HomeView()
        .environment(StatesManager())
}
