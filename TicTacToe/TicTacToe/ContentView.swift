    //
    //  ContentView.swift
    //  TicTacToe
    //
    //  Created by IACD-013 on 2022/05/24.
    //

/// Ad code for a draw state

import SwiftUI

struct ContentView: View {
    @State private var moves = ["","","","","","","","",""]
    @State private var endGameText = "TicTacToe"
    @State private var gameEnded = false
    @State private var isPlayingFirst = false
    
    private var ai = "O"
    private var ranges = [(0..<3), (3..<6), (6..<9)]
    
    var body: some View {
        VStack{
            Text(endGameText)
                .alert(endGameText, isPresented: $gameEnded){
                    Button("Reset", role: .destructive, action: resetGame)
                }
            Spacer()
                //MARK: Game
            
            ForEach(ranges, id: \.self){ range in
                HStack{
                    ForEach(range, id: \.self){ i in
                        XOButton(letter: $moves[i])
                            .simultaneousGesture(TapGesture()
                                .onEnded{_ in
                                    playerTap(index: i)
                                }
                            )
                    }
                }
                
            }
            
            
            Spacer()
            Button("Reset", action: resetGame)
        }
    }
    func playerTap(index: Int){
        //MARK: Populate array on tap
        if(isPlayingFirst){
            if moves[index] == ""{
                moves[index] = "X"
                    //            botMove()
                bestMove()
            }
            
        }
        else{
            bestMove()
            isPlayingFirst = true
        }
        
            //Check win state
        for letter in ["X", ai] {
            if checkWinner(list: moves, letter: letter){
                endGameText = "\(letter) has won?"
                gameEnded = true
                break
            }
        }
        
    
    }
    
    func botMove(){
        //Random
        var availableMoves: [Int] = []
        var movesLeft = 0
        
        for move in moves{
            if move == ""{
                availableMoves.append(movesLeft)
            }
            //Checking how many moves are left on the board and adding one to them everytime ti resets
            movesLeft += 1
        }
        
        if availableMoves.count != 0{
            moves[availableMoves.randomElement()!] = ai
        }
            
        
    }
    
    func bestMove(){
        var availableMoves: [Int] = []
        var movesLeft = 0
        var bestScore = -10000
        var move = String()
        
        for move in moves{
          
            if move == ""{
                availableMoves.append(movesLeft)
            }
            movesLeft += 1
        }
        
            //Is spot available ? if so make the move
        if availableMoves.count != 0{
//            moves[availableMoves.randomElement()!] = ai
            // check the board
            let score = minimax(board: moves,depth: 0, isMaximizing: false)
            moves[availableMoves[0]]  = ""
            if(score > bestScore){
                bestScore = score
                move =  moves[availableMoves[0]]
            }
            moves[availableMoves.randomElement()!]  = ai
        }
    }
    
    func minimax(board:[String],depth:Int ,isMaximizing:Bool) -> Int{
            //Min max function
        //Checking the terminal state of the game of the game
        let result = gameEnded
        if(result != true){
            
            let score  = 1
            return score
        }
        else{
            return -1
        }
        
        var availableMoves: [Int] = []
        var movesLeft = 0
        
        if(isMaximizing){
            var bestScore = -10000
            for move in moves{
                if move == ""{
                    availableMoves.append(movesLeft)
                }
                    //Checking how many moves are left on the board and adding one to them everytime it resets
                movesLeft += 1
            }
            
            if availableMoves.count != 0{ /// Finding the best score for all the possible next turns by the AI player
                moves[availableMoves[0]] = ai
                let score = minimax(board: moves, depth: +1, isMaximizing: false)
                moves[availableMoves[0]] = ""
                bestScore = max(score, bestScore)
            }
            return bestScore
        }
        else{ ///minimizing wants to find the best move for it
            
            var bestScore = 10000
            for move in moves{
                if move == ""{
                    availableMoves.append(movesLeft)
                }
                    //Checking how many moves are left on the board and adding one to them everytime it resets
                movesLeft += 1
            }
            
            if availableMoves.count != 0{ /// Finding the best score for all the possible next turns by the AI player
                moves[availableMoves[0]] = "X"
                let score = minimax(board: moves, depth: +1, isMaximizing: true)
                moves[availableMoves[0]] = ""
                bestScore = min(score, bestScore)
            }
            return bestScore
        }
        
    }
    
    func resetGame(){
            //MARK: reset the game
        endGameText = "TicTacToe"
        moves = ["","","","","","","","",""]
    }
    

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

