//
//  ViewController.swift
//  calculator test
//
//  Created by Edouard Long on 27/01/2016.
//  Copyright © 2016 Edouard Long. All rights reserved.
//

// TODO fix operator buttons and link up second display 

import UIKit

class ViewController: UIViewController {
    
    // declare a string that the numbers will be stored in
    var theNumber: String = " "
    
    // declare a string that will contain the total for the mini display
    var total: String = ""
    
    // declare a string that tracks the state of the total (0 = Addition, 1 = Subtraction, 2 = multiplictation, 3 = division, 4 = nothing)
    var currentOperator: Int = 5
    
    // declare a string that remebers the preivous total before the operation
    var oldTotal: String = "0"
    
    // declare a string that stores the current number
    var currentNumber: String = ""
    
    // Function that is called when any of the buttons are pressed (will be using tags to identify which button it was 0-9 Numbers, 10 DEL, 11 =, 12 +, 13 -, 14 x, 15 /, 16 Clear Screen)
    @IBAction func buttonPressed(sender: AnyObject) {
        // check if a number was pressed
        if sender.tag == 0 || sender.tag == 1 || sender.tag == 2 || sender.tag == 3 || sender.tag == 4 || sender.tag == 5 || sender.tag == 6 || sender.tag == 7 || sender.tag == 8 || sender.tag == 9{
            // put the number into the string and push it to the display
            theNumber += String(sender.tag)
            mainDisplay.text = theNumber
            
            // put the number into the currentNumber string
            currentNumber += String(sender.tag)
            
            // check if an operation was queued
            if currentOperator != 5{
                
                // check if it is addition
                if currentOperator == 0{
                    // perform the operation
                    total = String(Int(currentNumber)! + Int(oldTotal)!)
                    
                    //update the mini display
                    secondDisplay.text = total
                    
                }
                
                // check if its subtraction
                if currentOperator == 1{
                    // perform the operation 
                    total = String(Int(oldTotal)! - Int(currentNumber)!)
                    
                    //update the mini display
                    secondDisplay.text = total
                }
                
                // check if its multiplication
                if currentOperator == 2{
                    // perform the operation
                    total = String(Int(oldTotal)! * Int(currentNumber)!)
                    
                    //update the mini display
                    secondDisplay.text = total
                }
                
                // check if its division
                if currentOperator == 3{
                    // perform the operation
                    total = String(Int(oldTotal)! / Int(currentNumber)!)
                    
                    //update the mini display
                    secondDisplay.text = total
                }
            }
        }
        // check if clear screen was pressed
        else if sender.tag == 16{
            // wipe the number and update it
            theNumber = ""
            mainDisplay.text = theNumber
            
            // wipe the second screen and the set the current operator to zero and reset old total and total
            secondDisplay.text = ""
            currentOperator = 5
            oldTotal = "0"
            total = ""
            currentNumber = ""
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
                
                // change the current operator to addition
                currentOperator = 0
                
                // change the old total variable ( make sure that the total has something in it)
                if total.characters.count == 0{
                    oldTotal = currentNumber
                }
                else{
                    oldTotal = total
                }
                
                // reset the current number
                currentNumber = ""
                
            }
        }
        
        // check if subtract key was pressed
        else if sender.tag == 13{
            // check if an operator has alreadly been used by checking if the last value in the string is a space
            if theNumber[theNumber.endIndex.predecessor()] == " "{
            }
            else{
                // add the subtract operator the the display and then update it
                theNumber += String(" - ")
                mainDisplay.text = theNumber
                
                // change the operator to subtraction
                currentOperator = 1
                
                // change the oldTotal variable (make sure that total contains something)
                if total.characters.count == 0{
                    oldTotal = currentNumber
                }
                else{
                    oldTotal = total
                }
                
                //reset the current number
                currentNumber = ""
            }
        }
        
        // check if multiply key was pressed
        else if sender.tag == 14{
            // check if an operator has alreadly been used by checking if the last value in the string is a space
            if theNumber[theNumber.endIndex.predecessor()] == " "{
            }
            else{
                // add the subtract operator the the display and then update it
                theNumber += String(" x ")
                mainDisplay.text = theNumber
                
                // change the operator to multiplication
                currentOperator = 2
                
                // change the oldTotal variable (make sure that total contains something)
                if total.characters.count == 0{
                    oldTotal = currentNumber
                }
                else{
                    oldTotal = total
                }
                
                //reset the current number
                currentNumber = ""
            }
        }
        
        // check if divide key was pressed
        else if sender.tag == 15{
            // check if an operator has alreadly been used by checking if the last value in the string is a space
            if theNumber[theNumber.endIndex.predecessor()] == " "{
            }
            else{
                // add the subtract operator the the display and then update it
                theNumber += String(" ÷ ")
                mainDisplay.text = theNumber
                
                // change the operator to divsion
                currentOperator = 3
                
                // change the oldTotal variable (make sure that total contains something)
                if total.characters.count == 0{
                    oldTotal = currentNumber
                }
                else{
                    oldTotal = total
                }
                
                //reset the current number
                currentNumber = ""
            }
        }
    
        
        
        
    }
    
    // linking the label at the top
    @IBOutlet weak var mainDisplay: UILabel!
    
    // linking the secondary display
    @IBOutlet weak var secondDisplay: UILabel!
    


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

