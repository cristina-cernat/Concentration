//
//  ViewController.swift
//  Concentration1
//
//  Created by Cristina Mihaela on 18.02.2022.
//

import UIKit

class ViewController: UIViewController {

    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    @IBOutlet weak var flipCountLabel: UILabel!

    // IBAction useful only for XCode, not Swift - the circle
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1

        flipCard(withEmoji: "👻", on: sender)
    }

    @IBAction func touchSecondCard(_ sender: UIButton) {
        flipCount += 1

        flipCard(withEmoji: "🎃", on: sender)
    }

    func flipCard(withEmoji emoji: String, on button: UIButton) {
        print("flipCard(withEmoji: \(emoji))")
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = .orange
            button.backgroundColor = .orange
        } else {
            button.setTitle(emoji, for: UIControl.State.normal)
            // button.titleLabel?.font = UIFont(name: "System", size: 50)
            button.backgroundColor = .white
        }

    }


}

