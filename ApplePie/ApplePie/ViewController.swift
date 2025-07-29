//
//  ViewController.swift
//  ApplePie
//
//  Created by Kshitiz on 19/07/25.
//

import UIKit

class ViewController: UIViewController {
    var listOfWords: [String] = ["apple", "banana", "cherry", "pineapple", "mango", "guava", "papaya", "orange", "strawberry", "blueberry", "swift", "glorius", "bug", "program"]

    let incorrectMovesAllowed: Int = 7
    var totalWins: Int = 0{
        didSet{
            newRound()
        }
    }
    var totalLosses: Int = 0{
        didSet{
            newRound()
        }
    }

    @IBOutlet var treeImageView: UIImageView!
    @IBOutlet var correctWordLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var letterButtons: [UIButton]!
    
    // When application launches, viewDidLoad() is called, so its a good place to start newRound
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        newRound()
    }
    
    var currentGame: Game!
    
    func newRound() {
        if !listOfWords.isEmpty {
            let newWord = listOfWords.removeFirst()
            currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters: [])
            enableLetterButtons(true)
            updateUI()
        }else{
            enableLetterButtons(false)
        }
        
    }
    
    func enableLetterButtons(_ enable: Bool){
        for button in letterButtons {
            button.isEnabled = enable
        }
    }
    
    func updateUI() {
        var letters = [String]()
        for letter in currentGame.formattedWord {
            letters.append(String(letter))
        }
        let wordWithSpacing = letters.joined(separator: " ")
        correctWordLabel.text = wordWithSpacing
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
    }

    @IBAction func letterButtonPressed(_ sender: UIButton) {
            // Argument type is changed from any to UIButton
            // So as to determine which button has trigerred the method
            // if sender was of type Any, we can't access the title property
        sender.isEnabled = false
        // disables the button when once called
        let letterString = sender.configuration!.title!
        let letter = Character(letterString.lowercased())
        currentGame.playerGuessed(letter)
        updateGameState()
    }
    
    func updateGameState(){
        if currentGame.incorrectMovesRemaining == 0 {
            totalLosses += 1
        }else if currentGame.word == currentGame.formattedWord {
            totalWins += 1
        }else{
            updateUI()
        }
    }
}

