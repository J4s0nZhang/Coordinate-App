//
//  CalcViewController.swift
//  Scheduler and Grade Calc
//
//  Created by Huanyou Wei on 3/3/18.
//  Copyright © 2018 Huanyou Wei. All rights reserved.
//

import UIKit

class CalcViewController: UIViewController, UITextFieldDelegate {

    // MARK: Properties
    @IBOutlet weak var CurrentGradeTextField: UITextField!
    @IBOutlet weak var DesiredGradeTextField: UITextField!
    @IBOutlet weak var WeightTextField: UITextField!
    @IBOutlet weak var FinalGradeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        let s1 = CurrentGradeTextField.text
        let s2 = DesiredGradeTextField.text
        let s3 = WeightTextField.text
        let alert = UIAlertController(title: "Warning!", message: "My Message", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        let final = UIAlertController(title: "On your final, you need a", message: "My Message", preferredStyle: .alert)
        final.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        if !(s1!.isEmpty) && !(s2!.isEmpty) && !(s3!.isEmpty) {
            
            if Int(s1!) == nil || Int(s2!) == nil || Int(s3!) == nil {
                alert.message = "Please enter a number"
                present(alert, animated: true, completion: nil)
                return
            }
            
            let currentGrade = Double(s1!)
            let desiredGrade = Double(s2!)
            let weight = Double(s3!)
            
            if weight == 0{
                alert.message = "The weighting of the final cannot be 0"
                present(alert, animated: true, completion: nil)
                return
            }
            
            let finalGrade = (desiredGrade! - currentGrade!*((100-weight!)/100))/(weight!/100)
            final.message = String(finalGrade)
            present(final, animated: true, completion: nil)
        }
        else{
            alert.message = "Please don't leave any fields empty"
            present(alert, animated: true, completion: nil)
        }
    }
    
}
