//
//  AnimationsView.swift
//  AnimationDemo
//
//  Created by Nader Alfares on 9/23/24.
//
import SwiftUI


struct AnimationsView: View {
    @State var upScale : Bool = false
    @State var scale : CGFloat = 1.0
    @State var opacity : CGFloat = 1.0
    @State var square  = false
    @State var ratio : CGFloat = 1.0
    @State var depth : CGFloat = 0
    @State var angle :CGFloat = 45
    
    var body: some View {
        VStack(spacing:20) {
            
            Circle()
                .fill(.red)
                .frame(width:100)
            
            Rectangle()
                .fill(.blue)
                .frame(width:100,height:100)
            
            Diamond()
                .fill(.orange)
            
            
            Arc(offset: depth)
                .stroke(style: .init(lineWidth: 10.0, lineCap: .round, lineJoin: .round, miterLimit: 1.0, dash: [], dashPhase: 0))
            
            RoundedRectangle(cornerRadius: 10)
                .fill(.purple)
                .aspectRatio(0.20, contentMode: .fit)
                .frame(height: 100)
            
        }
        .padding()
    }
}

#Preview {
    AnimationsView()
}
