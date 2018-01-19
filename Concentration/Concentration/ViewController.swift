//
//  ViewController.swift
//  Concentration
//
//  Created by knail1 on 1/6/18.
//  Copyright © 2018 knail1. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    lazy var game: Concentration = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    // lazy is something only initialized when game is used somewhere..
     var flipCount = 0 {
        didSet {
             flipCountLabel.text = "Flipoos : \(flipCount)"
        }
    }
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBAction func touchCard(_ sender: UIButton) {
        
        flipCount += 1
        
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
            
            // the above passes the INDEX of the card , and the sender card reference thats calling the app. based on the emojiChoices variable which is set up exactly to mimic the card numbers in the phone display.
        } else {
            print("chosen card was not in cardButtons array trying to not crash the prog")
            // to avoid unwrapping nil, and crashing the app.
        }
     }
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
            }
        }
    }
    
    var emojiChoices = ["🤡", "😆", "🤡", "🤠", "🔫","🤓","🤣","🤜"]
    
    var emoji0 = Dictionary<Int, String>()
     // or
    var emoji = [Int: String]()
    
    
    
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
            
            // to guard against trying to call emoji dictionary still having something in there emojiChoices.count > 0
            // was used..
            
            //return emoji[card.identifier]!
        }
        // can also use for if x exists then {x} else {y} : return {x} ?? {y}
        return emoji[card.identifier] ?? "?"
    }
    
        
        
    func flipCard(withEmoji emoji: String, on button: UIButton) {
        print("flipCard(withEmoji: \(emoji))")
        
        // TIP: \(x) interprets x as string and prints it, arrays, dictionaries, numbers etc (.asString in java)
        
        //emoji is th internal variable , withEmoji is external variable
        // we'll look at the button, if its already already the ghost, (i.e card
        // is flipped, then we'll show the back of the card (with empty title, aka no picture emoji, but if not, then disply the emoji and right bg
        
        if button.currentTitle == emoji {
            // its already the front of the card, so flip to show back
            button.setTitle("", for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        } else {
            // its showing back of the card, so flip to show the clown.
            button.setTitle(emoji, for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
    
}

