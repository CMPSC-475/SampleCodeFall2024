//
//  CheerManager.swift
//  WeAre
//
//  Created by Nader Alfares on 8/29/24.
//

import Foundation

@Observable
class CheerManager {
    
    // THE MODEL
    private let cheeringModel : Cheering = PSUCheer()
    
    
    // The State of the App
    private enum CheerState {
        case ready, weare, pennstate, thankyou, yourwelcome
    }
    
    private var cheerState : CheerState = .ready
    
    
    
    var isFirstCheerVisible : Bool { cheerState == .weare || cheerState == .thankyou}
    var isSecondCheerVisible : Bool {cheerState == .pennstate || cheerState == .yourwelcome}
    var currentCheer : OneCheer {
        switch cheerState {
        case .ready:
            cheeringModel.initialCheer
        case .weare:
            cheeringModel.firstRound.firstCheer
        case .pennstate:
            cheeringModel.firstRound.secondCheer
        case .thankyou:
            cheeringModel.secondRound.firstCheer
        case .yourwelcome:
            cheeringModel.secondRound.secondCheer
        }
    }
    
    
    private var cheerCount = 0 {
        didSet {
            if cheerCount == 0 {
                cheerState = .ready
            } else if cheerCount <= cheeringModel.firstRound.count * 2 {
                cheerState = (cheerCount > 0 && cheerCount%2 == 1) ? .weare : .pennstate
            } else {
                cheerState = (cheerCount > 0 && cheerCount%2 == 1) ? .thankyou : .yourwelcome
            }
            
        }
    }
    
    func cheer() {
        cheerCount = (cheerCount + 1) % cheeringModel.totalCheers
    }
    
    
    
    
}
