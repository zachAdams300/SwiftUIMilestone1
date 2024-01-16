//
//  ContentView.swift
//  SwiftUIMilestone1
//
//  Created by Zachary Adams on 1/16/24.
//

import SwiftUI

struct ContentView: View {
    let moves = ["Rock", "Paper", "Scissors"]
    let winningMoves = ["Paper", "Scissors", "Rock"]
    
    @State private var currentMove = "Rock"
    @State private var shouldWin = true
    @State private var score = 0
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Current Move: \(currentMove)")
                    .font(.largeTitle)
                Text("You should " + (shouldWin ? "win" : "lose"))
                    .font(.headline)
                Spacer()
                
                ForEach(moves, id:\.self) { move in
                    Button(action: {
                        didTapMove(move)
                    }, label: {
                        Text(move)
                            .foregroundStyle(.white)
                            .frame(maxWidth: 200, maxHeight: 100)
                        
                    })
                    .background(.blue)
                    .clipShape(.capsule)
                    .padding()
//                    Button(move) {
//                        didTapMove(move)
//                    }
//                    .frame(width: 200, height: 100)
//                    .background(.blue)
//                    .foregroundStyle(.white)
//                    .clipShape(.capsule)
//                    .padding()
                }
                Spacer()
                Spacer()
            }
            .navigationTitle("Score: \(score)")
            .onAppear() {
                startGame()
            }
        }
    }
    
    func didTapMove(_ move: String) {
        if didSucceed(move) {
            score += 1
        }
        
        currentMove = moves.randomElement() ?? "Rock"
        shouldWin = Bool.random()
    }
    
    func didSucceed(_ move: String) -> Bool {
        if let pos = moves.firstIndex(of: currentMove), let winPos = winningMoves.firstIndex(of: move) {
            if shouldWin {
                return pos == winPos
            } else {
                return pos != winPos
            }
        }
        return false
    }
    
    func startGame() {
        score = 0
        currentMove = moves.randomElement() ?? "Rock"
        shouldWin = Bool.random()
    }
}

#Preview {
    ContentView()
}
