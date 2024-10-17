//
//  Manager+Search.swift
//  Map Explorer
//
//  Created by Nader Alfares on 10/3/24.
//
import MapKit

extension Manager {
    func searchFor(_ category: Category) {
        self.places.removeAll()
        let request = MKLocalSearch.Request()
        request.region = self.region
        request.naturalLanguageQuery = category.rawValue
        let search = MKLocalSearch(request: request)
        search.start { response, error in
            if let error {
                print("Error: \(error)")
                return
            }
            guard let response else {
                print("No response")
                return
            }
            
            let mapItems = response.mapItems
            for item in mapItems {
                let place = Place(mapItem: item, category: category, customName: nil)
                self.places.append(place)
            }
        }
        
    }
}
