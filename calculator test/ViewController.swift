//
//  ViewController.swift
//  calculator test
//
//  Created by Edouard Long on 27/01/2016.
//  Copyright © 2016 Edouard Long. All rights reserved.
//

// TODO fix operator buttons

import UIKit

class ViewController: UIViewController {
    
    // declare a string that the numbers will be stored in
    var theNumber: String = " "
    
    // Function that is called when any of the buttons are pressed (will be using tags to identify which button it was 0-9 Numbers, 10 DEL, 11 =, 12 +, 13 -, 14 x, 15 /, 16 Clear Screen)
    @IBAction func buttonPressed(sender: AnyObject) {
        // check if a number was pressed
        if sender.tag == 0 || sender.tag == 1 || sender.tag == 2 || sender.tag == 3 || sender.tag == 4 || sender.tag == 5 || sender.tag == 6 || sender.tag == 7 || sender.tag == 8 || sender.tag == 9{
            // put the number into the string and push it to the display
            theNumber += String(sender.tag)
            mainDisplay.text = theNumber
        }
        // check if clear screen was pressed
        else if sender.tag == 16{
            // wipe the number and update it
            theNumber = ""
            mainDisplay.text = theNumber
        }
        // check if the del key was pressed
        else if sender.tag == 10{
            // get the index of the last character of the string
            let index = theNumber.startIndex.advancedBy(theNumber.characters.count - 1)
            // remove the last digit from the calculator
            theNumber = theNumber.substringToIndex(index)
            mainDisplay.text = theNumber
        }
        // check if plus key was pressed
        else if sender.tag == 12{
            // check if an operator has alreadly been used by checking if the last value in the string is a space
            if theNumber[theNumber.endIndex.predecessor()] == " "{
            }
            else{
                // add the plus operator to the display and update it
                theNumber += String(" + ")
                mainDisplay.text = theNumber
            }
        }
    }
    
    // linking the label at the top
    @IBOutlet weak var mainDisplay: UILabel!
    


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

