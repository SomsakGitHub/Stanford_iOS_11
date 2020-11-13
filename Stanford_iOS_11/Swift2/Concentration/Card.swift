//
//  Card.swift
//  Stanford_iOS_11
//
//  Created by somsak on 4/11/2563 BE.
//

import Foundation

struct Card {
    
    var isFaceUp = false
    var isMatched = false
    var identifer: Int
    
    static var identiferFactory = 0
    
    static func getUniqueIdentifer() -> Int {
        identiferFactory += 1
        return identiferFactory
    }
    
    init() {
        self.identifer = Card.getUniqueIdentifer()
    }
}
