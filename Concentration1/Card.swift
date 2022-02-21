//
//  Card.swift
//  Concentration1
//
//  Created by Cristina Mihaela on 21.02.2022.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int

    static var identifierFactory = 0

    static func getUniqueIdentifier () -> Int {
        //Card.identifierFactory += 1
        // ^ i don't need to put Card. here
        // static method can access all static vars from this type
        identifierFactory += 1
        return identifierFactory
    }

    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
