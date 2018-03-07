//
//  CalcViewController.swift
//  Scheduler and Grade Calc
//
//  Created by Huanyou Wei and Jason Zhang on 3/3/18.
//  Copyright © 2018 Huanyou Wei and Jason Zhang. All rights reserved.
//

import UIKit

class CalcViewController: UIViewController, UITextFieldDelegate {

    // MARK: Properties
    //Have connects for all outlets
    @IBOutlet weak var CurrentGradeTextField: UITextField!
    @IBOutlet weak var DesiredGradeTextField: UITextField!
    @IBOutlet weak var WeightTextField: UITextField!
    @IBOutlet weak var FinalGradeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Handle the text field’s user input through delegate callbacks.
        CurrentGradeTextField.delegate = self
        DesiredGradeTextField.delegate = self
        WeightTextField.delegate = self
    }

    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }

    // Mark: Actions
    @IBAction func GetFinal(_ sender: UIButton) {
        //Create string constants that hold the labels' texts
        let s1 = CurrentGradeTextField.text
        let s2 = DesiredGradeTextField.text
        let s3 = WeightTextField.text
        
        //Create alerts and add an OK button onto the alert
        let alert = UIAlertController(title: "Warning!", message: "My Message", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        let final = UIAlertController(title: "On your final, you need a", message: "My Message", preferredStyle: .alert)
        final.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        
        //Check if any of the labels are empty
        if !(s1!.isEmpty) && !(s2!.isEmpty) && !(s3!.isEmpty) {
            
            //Check if the labels don't contain doubles
            if Double(s1!) == nil || Double(s2!) == nil || Double(s3!) == nil {
                //If they don't, warn the user and exit the function
                alert.message = "Please enter a number"
                present(alert, animated: true, completion: nil)
                return
            }
            
            //Typecast the label text into numbers
            let currentGrade = Double(s1!)
            let desiredGrade = Double(s2!)
            let weight = Double(s3!)
            
            //Check if the weighting of the final exam is 0
            if weight == 0{
                //If it is, warn the user and exit the function
                alert.message = "The weighting of the final cannot be 0"
                present(alert, animated: true, completion: nil)
                return
            }
            
            //Calculate the required final grade with the current and desired grades, and the weight
            //Also round the double to 2 decimal places
            let finalGrade = round(100*(desiredGrade! - currentGrade!*((100-weight!)/100))/(weight!/100))/100
            
            //Output the final grade in an alert
            final.message = String(finalGrade) + "%"
            present(final, animated: true, completion: nil)
        }
        else{
            //If the text fields are empty, warn the user
            alert.message = "Please don't leave any fields empty"
            present(alert, animated: true, completion: nil)
        }
    }
    
}
