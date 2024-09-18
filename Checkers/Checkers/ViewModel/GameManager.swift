//
//  GameManager.swift
//  Checkers
//
//  Created by Nader Alfares on 9/18/24.
//

import Foundation

class GameManager : ObservableObject {
    
    @Published var preferences : Preferences
    
    @Published var blockSize = 100
    @Published var pieces : [Piece]
    
    var boardSize : Int {preferences.boardDimension}
    
 
    
    // initialize preferences and pieces model
    init() {
        preferences = Preferences()
        pieces = [Piece]()
        initializePieces()
    }
    
    private func initializePieces() {
    }
    
    private func resetPieces() {
        //put pieces back into their initial position
    }
    
    
    // Intents
    func resetGame() {
        resetPieces()
    }
}
