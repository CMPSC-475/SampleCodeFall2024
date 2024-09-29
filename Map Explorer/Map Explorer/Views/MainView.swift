//
//  MainView.swift
//  Map Explorer
//
//  Created by Nader Alfares on 9/28/24.
//
import SwiftUI
import MapKit

extension CLLocationCoordinate2D {
    static let stateCollege = CLLocationCoordinate2D(latitude: 40.79550030, longitude: -77.85900170)
}

struct MainView: View {
    @Environment(Manager.self) var manager : Manager

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    MainView()
        .environment(Manager())

}
