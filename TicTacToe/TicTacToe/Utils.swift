//
//  Utils.swift
//  TicTacToe
//
//  Created by IACD-013 on 2022/05/24.
//

import Foundation

func checkWinner(list: [String], letter: String) -> Bool{
    let winningSequences = [
        // Horizontal rows
        [0,1,2], [3,4,5], [6,7,8],
        [0,4,8], [2,4,6], // Diaoginal rows
        [0,3,6], [1,4,7], [2,5,6] // Vertical rows
    ]
    
    //Loop over the rows
    for sequence in winningSequences {
        var score = 0
        
        //loop into each array variable to check if its fine
        for match in sequence{
            if list[match] == letter{
                score += 1
                
                //If it equals 3 then a match is won
                /// we won or the bot won
                if score == 3 {
                    return true
                }
            }
        }
    }
    return false // no winners 
}
