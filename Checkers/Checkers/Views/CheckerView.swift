//
//  CheckerView.swift
//  Checkers
//
//  Created by Nader Alfares on 9/19/24.
//

import SwiftUI

struct CheckerView: View {
    @Environment(GameManager.self) var manager
    @Binding var piece : Piece
    @State private var offset = CGSize.zero
    var body: some View {
        let dragGesture = DragGesture()
            .onChanged { value in
                offset = value.translation
            }
            .onEnded { value in
                let offset = manager.offset(for: piece, from: offset)
                piece.moveBy(offset: offset)
                self.offset = CGSize.zero
            }
        PieceView(piece: piece)
            .position(manager.positionFor(piece))
            .offset(offset)
            .gesture(dragGesture)
        
    }
}

#Preview {
    CheckerView(piece: .constant(Piece.standard))
        .environment(GameManager())
}
