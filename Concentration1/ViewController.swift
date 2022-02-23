//
//  ViewController.swift
//  Concentration1
//
//  Created by Cristina Mihaela on 18.02.2022.
//

import UIKit

// Controller

class ViewController: UIViewController {

    lazy var game = Concentration(numberOfPairs: (cardButtons.count + 1) / 2) // communicate with model


    @IBOutlet weak var flipCountLabel: UILabel!

    @IBOutlet weak var scoreLabel: UILabel!

    @IBOutlet var cardButtons: [UIButton]!

    @IBOutlet weak var newGameButton: UIButton!

    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            print("card number = \(cardNumber)")
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("card not found in cardButtons")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad() // must
        setTheme()
    }

    // New game
    @IBAction func touchNewGame() {
        game = Concentration(numberOfPairs: (cardButtons.count + 1) / 2)
        setTheme()
        updateViewFromModel()

    }


    // Update
    func updateViewFromModel() {
        for index in cardButtons.indices  {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(setEmoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = .white
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? .clear : currentTheme.color
            }
        }

        flipCountLabel.text = "Flips: \(game.flipCount)"
        scoreLabel.text = "Score: \(game.score)"

    }


    // Theme
    var currentTheme = Theme()

    var emoji = [Int: String]()
    func setEmoji(for card: Card) -> String {

        if emoji[card.identifier] == nil, currentTheme.emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(currentTheme.emojiChoices.count)))
            emoji[card.identifier] = currentTheme.emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }

    var themeChoices : [Theme] = [
        Theme(color: .orange, emojiChoices: ["👻", "🎃", "🦇", "🍭", "🍬", "🙀", "🍎", "😈", "😱", "🤯"]),
        Theme(color: .green, emojiChoices: ["🌸", "🌼", "🌲", "🍄", "🍁", "🍊", "🍏", "🍑", "🍉", "🍒"]),
        Theme(color: .brown, emojiChoices: ["🐷", "🐱", "🐶", "🦊", "🐤", "🦀", "🦇", "🦭", "🐍", "🐬"]),
        Theme(color: .yellow, emojiChoices: ["🥰", "🥳", "😎", "😡", "🥶", "😵‍💫", "😂", "😇", "🥲", "😩"]),
        Theme(color: .blue, emojiChoices: ["🏀", "🎾", "🏈", "🎱", "⚽️", "🏸", "⛳️", "⛸", "🏹", "🪁"]),
        Theme(color: .cyan, emojiChoices: ["⌚️", "🖥", "📲", "⏰", "☎️", "💶", "📈", "📉", "✏️", "📌"])
    ]


    func setTheme() {
        currentTheme = themeChoices.randomElement() ?? Theme()
        for button in cardButtons {
            button.backgroundColor = currentTheme.color
        }
        newGameButton.backgroundColor = currentTheme.color
        flipCountLabel.textColor = currentTheme.color
        scoreLabel.textColor = currentTheme.color
    }
}

