//
//  PlaceDetailView.swift
//  Map Explorer
//
//  Created by Nader Alfares on 9/28/24.
//
import SwiftUI

struct PlaceDetailView: View {
    @Environment(Manager.self) var manager : Manager
    var place : Place
    var body: some View {
        
        VStack(alignment:.leading) {
            HStack(alignment: .top) {
                VStack(alignment:.leading) {
                    Text(place.name).font(.title)
                    HStack {
                        Text("Point of Interest")
                        Text(manager.poiCategoryStringFrom(place.mapItem.pointOfInterestCategory))
                        Text("·")
                        Text("Other Info")
                        Text(manager.infoFrom(place.mapItem.placemark))
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
