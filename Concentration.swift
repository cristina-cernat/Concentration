//
//  Concentration.swift
//  Concentration1
//
//  Created by Cristina Mihaela on 21.02.2022.
//

import Foundation
// Model

class Concentration {

    var cards = [Card]()

    var indexOfOneAndOnlyFaceUpCard: Int?

    var flipCount = 0

    var score = 0

    var seenCards: [Int] = []

    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            flipCount += 1
            // if 1 card up:
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // check if cards match:
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true

                    score += 2
                } else {
                    if cards[index].isSeen == true {
                        score -= 1
                    }
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                // either no cards or 2 cards are face up, so no matching
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
                // MARK: is seen
                cards[index].isSeen = true
            }
        }
    }


    init(numberOfPairs: Int) {
        for _ in 0..<numberOfPairs {
            let card = Card()
            cards += [card, card]
        }
        cards = cards.shuffled()
        flipCount = 0
        score = 0
    }
}
