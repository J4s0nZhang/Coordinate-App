//
//  PlannerTableViewController.swift
//  Scheduler and Grade Calc
//
//  Created by Huanyou Wei on 3/4/18.
//  Copyright © 2018 Huanyou Wei. All rights reserved.
//

import UIKit

class PlannerTableViewController: UITableViewController {

    //MARK: Properties
    
    var events = [Event]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load the sample data.
        loadSampleEvents()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "PlannerTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? PlannerTableViewCell  else {
            fatalError("The dequeued cell is not an instance of PlannerTableViewCell.")
        }
        
        // Fetches the appropriate event for the data source layout.
        let event = events[indexPath.row]
        
        cell.nameLabel.text = event.name
        cell.dateLabel.text = event.date

        return cell
    }

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            events.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    //MARK: Actions
    
    @IBAction func unwindToEventList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? ViewController, let event = sourceViewController.event {
            
            // Add a new event.
            let newIndexPath = IndexPath(row: events.count, section: 0)
            
            events.append(event)
            
            tableView.insertRows(at: [newIndexPath], with: .automatic)
            
        }
        
    }
    

    //MARK: Private Methods

    private func loadSampleEvents() {
        //Create some sample events
        guard let event1 = Event(name: "English", date: "Monday, Jan 01, 2018, 22:59") else {
            fatalError("Unable to instantiate event1")
        }
        
        guard let event2 = Event(name: "Math", date: "Monday, Jan 01, 2018, 22:59") else {
            fatalError("Unable to instantiate event2")
        }
        
        guard let event3 = Event(name: "Computer Science", date: "Monday, Jan 01, 2018, 22:59") else {
            fatalError("Unable to instantiate event3")
        }
        
        //Append them to the events array
        events += [event1, event2, event3]
        
    }
    

}
