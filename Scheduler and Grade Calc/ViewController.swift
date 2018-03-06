//
//  ViewController.swift
//  Scheduler and Grade Calc
//
//  Created by Huanyou Wei on 2/28/18.
//  Copyright © 2018 Huanyou Wei. All rights reserved.
//

import UIKit
import os.log

class ViewController: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak var appName: UIView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var event: Event?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // get the navigation bar from the current navigation controller if there is one
        
    }
    
    //MARK: Navigation
    
    // This method lets you configure a view controller before it's presented.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        // Configure the destination view controller only when the save button is pressed.
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        
        let name = nameTextField.text ?? ""
        let date = dateTextField.text ?? ""
        
        event = Event(name: name, date: date)
    }
    
}

