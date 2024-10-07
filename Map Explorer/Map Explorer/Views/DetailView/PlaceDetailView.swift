//
//  PlaceDetailView.swift
//  Map Explorer
//
//  Created by Nader Alfares on 9/28/24.
//
import SwiftUI

struct PlaceDetailView: View {
    @Environment(Manager.self) var manager : Manager
    var place : Favorite
    var body: some View {
        
            VStack(alignment:.leading) {
                HStack(alignment: .top) {
                    VStack(alignment:.leading) {
                        Text(place.title).font(.title)
                        HStack {
                            Text("Point of Interest")
                            Text("·")
                            Text("Other Info")
                        }
                        
                    }.padding([.bottom,.leading])
                    Spacer()
                    ControlButtons()
                }
                ButtonRow()
                    .padding()
            }
    }
}

//#Preview {
//    PlaceDetailView(place: Favorite)
//        .environment(Manager())
//}
