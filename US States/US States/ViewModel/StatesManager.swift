//
//  StatesManager.swift
//  US States
//
//  Created by Nader Alfares on 10/19/24.
//
import Foundation
import Observation

typealias USStates = [USState]

@Observable
class StatesManager {
    var theStates : USStates
    private let persistence : Persistence<USStates>
    
    init() {
        let filename = "StatesData"
        persistence = Persistence<USStates>(filename:filename)
        
        let _theStates = persistence.modelData ?? []
        theStates = _theStates
    }
    
    func save() {
        persistence.save(theStates)
    }
    
    func formatted(year:Int) -> String {
        String(format: "%04d",year)
    }
    
}

