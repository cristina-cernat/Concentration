//
//  ViewController.swift
//  Concentration1
//
//  Created by Cristina Mihaela on 18.02.2022.
//

import UIKit

class ViewController: UIViewController {

    // instance of the controller
    // lazy means "initialize this only when someone tries to use this var"
    // lazy counts as "this var is initialized"
    lazy var game = Concentration(numberOfPairs: (cardButtons.count + 1) / 2)
    // lazy cannot have didSet{}

    // propery observer
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }

    @IBOutlet weak var flipCountLabel: UILabel!

    @IBOutlet var cardButtons: [UIButton]! // array of buttons


    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            print("card number = \(cardNumber)")
            //flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
            game.chooseCard(at: cardNumber)
            // the game might change in the meantime so we update:
            updateViewFromModel()
        } else {
            print("card not found in cardButtons")
        }

    }


    @IBAction func touchNewGame() {
        flipCount = 0
        
    }

    func updateViewFromModel() {
        // we check if the cards are matched
        for index in cardButtons.indices  {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                // button.titleLabel?.font = UIFont(name: "System", size: 50)
                button.backgroundColor = .white
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? .clear : .orange

            }
        }
    }

    var emojiChoices = ["👻", "🎃", "🦇", "🍭", "🍬", "🙀", "🍎", "😈", "😱", "🤯"]

    // empty dictionary:
    //var emoji = Dictionary<Int, String>()
    var emoji = [Int: String]()
    func emoji(for card: Card) -> String {
        // looking up in the dictionary, we get an !!!optional String:
        // we could use if let, but this is also ok
        // this next section can be summed with the last return
//        if emoji[card.identifier] != nil {
//            return emoji[card.identifier]!
//        } else {
//            return "?"
//        }

        // loading dict on demand
        // back to back if's
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            // type conversion 101:
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            // unique emoji
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)

        }


        // summed up return
        // return thing. if it's nil, return "?"
        return emoji[card.identifier] ?? "?"
    }

//    func flipCard(withEmoji emoji: String, on button: UIButton) {
//        print("flipCard(withEmoji: \(emoji))")
//        if button.currentTitle == emoji {
//            button.setTitle("", for: UIControl.State.normal)
//            button.backgroundColor = .orange
//        } else {
//            button.setTitle(emoji, for: UIControl.State.normal)
//            // button.titleLabel?.font = UIFont(name: "System", size: 50)
//            button.backgroundColor = .white
//        }
//
//    }


}

