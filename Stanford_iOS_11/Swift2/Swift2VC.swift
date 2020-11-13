//
//  Swift2VC.swift
//  Stanford_iOS_11
//
//  Created by somsak on 4/11/2563 BE.
//

import UIKit

class Swift2VC: UIViewController {
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    //It will not be calculated if it is not called.
    //And if there are many requests for information Will only calculate once
    lazy var game = Concentration(numberOfPairsOfCards: (cardButton.count + 1) / 2)
    
    var flipCount = 0 {
        didSet {
            self.flipCountLabel.text = "\(self.flipCount)"
        }
    }
    
    @IBOutlet var cardButton: [UIButton]!
    
    var emojiChoices = ["1", "2", "3", "4"]
    var emoji = [Int:String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func touchCollection(_ sender: UIButton) {
        
        var dialogMessage = UIAlertController()
        self.flipCount += 1
        
        if let cardCollection = cardButton.index(of: sender) {
            game.chooseCard(at: cardCollection)
            updateViewFromModel()
        }
    }
    
    func updateViewFromModel() {
        
        for index in cardButton.indices {
            let button = cardButton[index]
            let card = game.cards[index]
            
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0) : #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
            }
        }
    }
    
    func emoji(for card: Card) -> String {
        if emoji[card.identifer] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifer] = emojiChoices.remove(at: randomIndex)
        }
        
        return emoji[card.identifer] ?? "?"
    }
}

