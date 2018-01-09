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

    // swift requires all variables (aka properties) to be initalized with an initial value
    
    var flipCount0: Int = 0
    
    // swift is extremely strongly typed language, you have to be VERY specific in what you want to use
    // also has strong type inference (it will guess type for you) so you could have used:
    
    var flipCount = 0 {
        didSet {
            // this code observes this variable changing and everytime it changes, this {}
            // segment executes the code... so let's move the flipCoundLabel here..
            flipCountLabel.text = "Flips : \(flipCount)"
        }
    }
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    // ! explanation coming later..
   
   
    @IBAction func touchSecondCard(_ sender: UIButton) {
        
        flipCard(withEmoji: "😆", on: sender)
        flipCount += 1
        
    }
    
    
    // now we'll write a functin which does flips the card over and presents the emoji
    // when the card (button) is clicked
    // it will take the emoji you want to show presented up on this card when flipped
    // and the button on which you want that emoji to be flipped (heck thats all the work!)
    @IBAction func touchCard(_ sender: UIButton) {
        
        // TIP: to fix an object calling multiple IBActions, you can right click on the
        // object and see what "TouchUPInide" is calling and update it just to call the
        // required IBAction function.
        
        // let's pring variable passed to function called sender of type UIButton
        //print("touchCard(\(sender))")
        
        flipCard(withEmoji: "🤡", on: sender)
        flipCount += 1
        
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
