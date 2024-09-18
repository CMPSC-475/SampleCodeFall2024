//
//  GameManager+CG.swift
//  Checkers
//
//  Created by Nader Alfares on 9/18/24.
//

import Foundation


extension GameManager {
    // translate model position (row,col) to view position
    func positionFor(_ piece: Piece) -> CGPoint {
        //TODO: -
        return CGPoint(x: 0, y: 0)
    }
    
    // Convert from view's CGSize to Model's Size
    private func offset( for size:CGSize) -> Offset {
        //TODO: -
        return Offset(x: 0, y: 0)
    }
    
    // home team moves y = +1, x = -1,0,1;
    // away team moves y = -1, x = -1,0,1
    func legal(_ offset:Offset, for player:Player) -> Bool {
        (-1...1).contains(offset.x) && player == .home ? offset.y==1 : offset.y == (-1)
    }
    
    func offset(for piece:Piece, from size:CGSize) -> Offset {
        //TODO: - 
       return Offset(x: 0, y: 0)
    }
    
    
}
