//
//  Concentration.swift
//  Concentration
//
//  Created by knail1 on 1/11/18.
//  Copyright © 2018 knail1. All rights reserved.
//

import Foundation


    // this is part of the model

class Concentration
{
    // when making a class, put all func's etc already in
    // makes you think clearly about the design
    
    var cards0 = Array<Card>()
    // also what works is:
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int){
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // check if cards match since we now have 2 cards up
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                // either no cards are face up, or both cards are face up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
            
        }
        
    }
    
    // classes get a FREE init with no args as long as the the variables are defined.
    
    // let's still make an initiatizer WITH args:
    
    // MARK: Initialize number of pairs of cards
    
    init(numberOfPairsOfCards: Int) {
        // let card = Card(isFaceUp: false, isMatched: false, identifier: 007)
        // however the above is gross, these are the same values the Card struct has specified
        
        for _ in 1...numberOfPairsOfCards {
            
            // let card = Card(identifier: identifier)
            let card = Card() // I want to automatically create a unique ID..
            
            // let matchingCard = Card(identifier: identifier)
            // or I could do this:
            // let matchingCard = card // since struct is a COPY of another struct
            // but appending also COPIES a struct, so we dont even need the abeo
            
            cards += [card, card]
            
            // cards.append(card)
            //cards.append(card)
        }
        
        // TODO: shuffle the cards <HW
        
    }
}
