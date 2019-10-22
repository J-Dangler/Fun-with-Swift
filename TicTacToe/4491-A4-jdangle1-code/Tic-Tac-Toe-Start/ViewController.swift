//
//  ViewController.swift
//  TicTacToe
//
//  Created by Sharon on 4/14/19.
//  Copyright © 2019 Sharon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var activePlayer = 1                                // 1 = x player and starts the game; 2 = O player
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]         // nine squares; 0 = not seleted; and 1 or 2 = selected
    var winningCombinations = [[0,1,2], [3,4,5], [6,7,8], [0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]  // double dimensional array that defines the winning cell selected combinations
    var isGameActive = true                             // flag indicating game running
    var playCount = 0                                   // counter for number of selections (when == 9 game over)
    var gameOverflag = 0                                // bool to used to indicate game over.
    
    @IBOutlet weak var winner: UILabel!                 // label that will display game results
    @IBOutlet weak var currrentPlayerLabel: UILabel!
    func updatePlayerLabel() {
    if (activePlayer == 1) {
    currrentPlayerLabel.text = "O"
    }
    else if (activePlayer == 2) {
    currrentPlayerLabel.text = "X"
    }
    }
    
    // step 1 - connect all the buttons to the below IBAction func buttonPress
    @IBAction func buttonPress(_ sender: AnyObject) {
        // button press action method - each button is connected to this action.

        // each button is defined with a unique tag number 1 through 9 (done on the story baord)
        // use the button tag number to access the gameState array.
        
        // step 2:
        // if the gameState array element is 0 (not selected) and the game is still active (isGameActive flag == true)
        // then process the selection inside the if case
        
        //updatePlayerLabel()
        if (gameState[sender.tag-1] == 0 && isGameActive == true) {
        //updatePlayerLabel()
            // step 3:
            // set the gameState element to the activePlayer; this keeps which grid cells each player has seelcted.
//            gameState[sender.tag-1] = activePlayer                    // save the active player ( 1 or 2) to the game state
            gameState[sender.tag-1] = activePlayer
            //updatePlayerLabel()
            // step 4:
            // evaluate which player is active; if acvtivePayer == 1 then set the button image and swap players
            if activePlayer == 1 {
                sender.setImage(UIImage(named: "ltrX"), for: UIControl.State())             // place an x on the board
                updatePlayerLabel()
                activePlayer = 2
              
                // swap players O turn
            } else {
                sender.setImage(UIImage(named: "ltrO"), for: UIControl.State())             // place an x on the board
                updatePlayerLabel()
                activePlayer = 1
                 // swap players X turn
            }
            // step 5:
            // count the number of plays
            playCount = playCount + 1                                                       // count the number of plays
        }
        
        // step 6:
        // check to see if game over with a draw
        if gameOverflag == 0 && playCount == 9 {
            winner.text = "Draw - No Winner!"
        }
        
        // setp 7:
        // games not over - look for a winner by using the winning combinations definitions to examine the gamestate selections
        for i in winningCombinations {
            
            // using the winning combinations to access the game state; i will be an array of 3 elements 0,1,2
            // the game is over when the game state for the winning combination are all equal (all 1 or all 2)
            // a gamestate element equal to 0 means it has not been selected
            if isGameActive == true && gameState[i[0]] != 0 && gameState[i[0]] == gameState[i[1]] && gameState[i[1]] == gameState[i[2]] {
                
                isGameActive = false            // there is a winner; set the game active to false.
                gameOverflag = 1                // the game is over
                
                // when the game is playing the activePlayer is switched before game is won
                if activePlayer == 2 {
                    winner.text = "X marks the spot! X won"
                    currrentPlayerLabel.text = "X"
                }
                if activePlayer == 1 {
                    winner.text = "Oh no! O won"
                    currrentPlayerLabel.text = "O"
                }
            }
        }
    }
    
    // step 8:
    // reset the the game variables to the starting values.
    @IBAction func playAgainButtonPress(_ sender: Any) {
        isGameActive = true                                         // start the game over
        activePlayer = 2
        updatePlayerLabel()
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]                     // clear selections
        winner.text = "O has first turn"                                            // clear the winner label
        for j in 1...9 {
            let button = view.viewWithTag(j) as! UIButton           // get the button using the buttons tag
            button.setImage(nil, for: UIControl.State())            // remove the button image
        }
        gameOverflag = 0                                            // start the game over
        playCount = 0                                               // zero out the play count
    }

}

