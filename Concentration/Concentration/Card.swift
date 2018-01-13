//
//  Card.swift
//  Concentration
//
//  Created by knail1 on 1/11/18.
//  Copyright © 2018 knail1. All rights reserved.
//

import Foundation


struct Card
{
    // no inheritance in struct
    // struct = value type, classes = reference type
    
    // this is part of the Model not the UI, so it doesn't have
    // the emoji etc .. its just talking about how to display
    // not what is shown in the view..
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
        
    }
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
}
