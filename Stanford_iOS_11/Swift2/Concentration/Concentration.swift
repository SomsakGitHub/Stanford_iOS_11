//
//  Concentration.swift
//  Stanford_iOS_11
//
//  Created by somsak on 4/11/2563 BE.
//

import Foundation

class Concentration {

    var cards = [Card]()
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int){
        dump(cards)
        
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // check if cards match
                if cards[matchIndex].identifer == cards[index].identifer {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            }else{
                // either no cards or 2 carsd are
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
                
                dump(cards)
                
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
//        print("numberOfPairsOfCards", numberOfPairsOfCards)

        for _ in 1...numberOfPairsOfCards {
            
            let card = Card()
//            dump(card)
            
            cards += [card, card]
//            dump(cards)
            
        }
    }
}
