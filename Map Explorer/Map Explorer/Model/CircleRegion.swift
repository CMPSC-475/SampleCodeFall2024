//
//  CircleRegion.swift
//  Map Explorer
//
//  Created by Nader Alfares on 10/8/24.
//
import Foundation

struct CircleRegion : Identifiable{
    let center: Coord
    var radius : Double
    var id = UUID()
    
    mutating func updateRadius(to newRadius:Double) {
        radius = newRadius
    }
}
