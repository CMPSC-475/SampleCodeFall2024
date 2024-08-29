//
//  CheerManager.swift
//  WeAre
//
//  Created by Nader Alfares on 8/29/24.
//

import Foundation

@Observable
class CheerManager {
    var isFirstCheerVisible : Bool
    var isSecondCheerVisible = false
    private var cheerCount = 0
    
    init() {
        isFirstCheerVisible = false
    }
    func cheer() {
        cheerCount += 1
        isFirstCheerVisible = cheerCount%2 == 1
        isSecondCheerVisible = cheerCount%2 == 0
        
    }
    
    
    
    
}
