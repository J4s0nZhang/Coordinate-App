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
    //Have a connection for every outlet
    @IBOutlet weak var appName: UIView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var selectedDate: UILabel!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var event: Event?
    
    //Called when the view is loaded, used for additional initialization
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //Cancels the creation of a new event
    //MARK: Navigation
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    // This method lets you configure a view controller before it's presented.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        // Configure the destination view controller only when the save button is pressed.
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        
        let name = nameTextField.text ?? ""
        let date = selectedDate.text
        
        event = Event(name: name, date: date!)
    }
    
    //Converts a date to a string and assigns it to the selectedDate label
    //MARK: Actions
    @IBAction func datePickerAction(_ sender: Any) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM dd, yyyy, HH:mm"
        selectedDate.text = dateFormatter.string(from: datePicker.date)
    }
    
}

