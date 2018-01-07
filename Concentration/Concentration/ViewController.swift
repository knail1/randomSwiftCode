//
//  ViewController.swift
//  Concentration
//
//  Created by knail1 on 1/6/18.
//  Copyright © 2018 knail1. All rights reserved.
//

import UIKit

class ViewController: UIViewController {




    
    @IBAction func touchCard(_ sender: UIButton) {
        // variable passed to function called sender of type UIButton
        
        flipCard(withEmoji: "🤡", on: sender)
        
    }
    
    // now we'll write a functin which does flips the card over and presents the emoji
    // when the card (button) is clicked
    // it will take the emoji you want to show presented up on this card when flipped
    // and the button on which you want that emoji to be flipped (heck thats all the work!)
    
    func flipCard(withEmoji emoji: String, on button: UIButton) {
        //emoji is th internal variable , withEmoji is external variable
        // we'll look at the button, if its already already the ghost, (i.e card
        // is flipped, then we'll show the back of the card (with empty title, aka no picture emoji, but if not, then disply the emoji and right bg
        

        
        if button.currentTitle == emoji {
            // its already the front of the card, so flip to show back
            button.setTitle("", for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        } else {
            // its showing back of the card, so flip to show the clown.
            button.setTitle("🤡", for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
    
}
