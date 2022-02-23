//
//  Theme.swift
//  Concentration1
//
//  Created by Cristina Mihaela on 22.02.2022.
//

import Foundation
import UIKit
// Model

struct Theme {
    var color: UIColor
    var emojiChoices: [String]

    init() {
        color = .white
        emojiChoices = ["??"]
    }

    init(color: UIColor, emojiChoices: [String]) {
        self.color = color
        self.emojiChoices = emojiChoices
    }

    
}
