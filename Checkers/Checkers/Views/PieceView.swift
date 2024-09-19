//
//  PieceView.swift
//  Checkers
//
//  Created by Nader Alfares on 9/19/24.
//

import SwiftUI

struct PieceView: View {
    @Environment(GameManager.self) var manager
    let piece : Piece
    let pieceScaleFactor = 0.8
    var body: some View {
        let dimension = CGFloat(manager.blockSize) * pieceScaleFactor
        Image(piece.player == .home ? "homePiece" : "awayPiece")
            .resizable()
            .frame(width:dimension,height: dimension)
    }
}

#Preview {
    PieceView(piece: Piece.standard)
        .environment(GameManager())
}


