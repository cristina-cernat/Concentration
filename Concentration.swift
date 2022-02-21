//
//  Concentration.swift
//  Concentration1
//
//  Created by Cristina Mihaela on 21.02.2022.
//

import Foundation

class Concentration {
    // we start by stating what the app essentially does
    // create instance of a class/struct:
    //var cards = Array<Card>()
    var cards = [Card]()

    var indexOfOneAndOnlyFaceUpCard: Int?

    func chooseCard(at index: Int) {
        // flip cards
//        if cards[index].isFaceUp {
//            cards[index].isFaceUp = false
//        } else {
//            cards[index].isFaceUp = true
//      }

        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
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
            }

        }
    }

    func resetGame() {

    }

    init(numberOfPairs: Int) {
        for _ in 0..<numberOfPairs {
            //let card = Card(identifier: identifier)
            // ^ we don't want the controller to care about identifiers!!

            let card = Card()

            // we need to also create the OTHER card matching this one
            //let matchingCard = card

            // we don't actually need to create a copy
            // when we append in array it ALSO COPIES the struct
            //cards.append(card)
            //cards.append(card)
            cards += [card, card]
        }
        // TODO: Suffle the cards


    }
}
