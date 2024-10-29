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
    
    var centuries : [Int] {
        return Array(Set(theStates.map({$0.centuryFounded}))).sorted()
    }
    
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
    
    func centuryTitle(for century:Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .ordinal
        let ordinal = formatter.string(from: NSNumber(value: century + 1))!
        let title = "Founded in the \(ordinal) century"
        return title
    }
    
}

