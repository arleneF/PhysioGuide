//
//  CurrentRoutineTVC.swift
//  PhysioGuide_7
//
//  Created by Thomas Breen on 2015-12-01.
//  Copyright © 2015 Team STAR. All rights reserved.
//

import UIKit

class CurrentRoutineTVC: UITableViewController, ContainerViewControllerProtocol {
    // MARK: Properties
    
    //internal var parentViewController1: CreateRoutineVC!
    
    var exercises = [Exercise]()
    // var exercises : [String : String] = ["routineName" : "", "exID1" : "", "exID2" : "", "exID3" : "", "exID4" : "", "exID5" : "", "exID6" : "", "exID7" : "", "exID8" : "", "exID9" : "", "exID10" : "", "exID11" : "", "exID12" : "", "exID13" : "", "exID14" : "", "exID15" : "", "exID16" : "", "exID17" : "", "exID18" : "", "exID19" : "", "exID20" : ""]
    
    /*
    func loadSampleExercises() {
    let icon1 = UIImage(named: "Title")
    let exercise1 = Exercise(name: "Squat", icon: icon1, link: "youtube.com/squatexample")!
    
    let icon2 = UIImage(named: "Title")
    let exercise2 = Exercise(name: "Lunge", icon: icon2, link: "youtube.com/lungeexample")!
    
    let icon3 = UIImage(named: "Title")
    let exercise3 = Exercise(name: "Jogging", icon: icon3, link: "youtube.com/joggingexample")!
    
    exercises += [exercise1, exercise2, exercise3]
    
    }
    */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //load sample data
        //loadSampleExercises()
    }
    
    //how many sections should be in the table view controller? Perhaps 3, one for each of Strech/Strength/Cardio
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1 // Currently I don't have any way of know which section an exercise would be in. Need to add some logic in a different function and also an attribute to the object (exercise.swift) being placed into the array so that they can be dequeued into the correct section.
    }
    
    //how many rows are in each section. Currently placing the number of exercises to be safe - could be different though.
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercises.count
    }
    //var count = 0
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Table view cels are reused and should be dequeued using a cell identifier
        let cellIdentifier = "CurrentRoutineCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! CurrentRoutineCell
        
        
        // Fetches the appropriate exerecise for the data source layout.
        let exercise = exercises[indexPath.row]
        
        cell.name.text = exercise.name
        cell.icon.image = exercise.icon
        //count++
        //print("count: \(count)")
        return cell
    }
    
    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            exercises.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
    
    }
    */
    
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the item to be re-orderable.
    return true
    }
    */
    
    /*
    //make a reference for parentViewController1 so that I can call functions from it
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if let vc = segue.destinationViewController as? CreateRoutineVC where segue.identifier == "CurrentRoutineSegue" {
    self.parentViewController1 = vc
    }
    }*/
    /*
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "CurrentRoutineSegue" {
    let pvc = segue.destinationViewController as! CreateRoutineVC
    //pvc.delegate = self
    }
    }

    */
    
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Current Routine"
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        //let's try to get the data from the cell instead of something else ayyy
        //let index = indexPath.row // This is the specified row of the table list. Starts from 0, goes to exercises.count-1
        let cell = tableView.cellForRowAtIndexPath(indexPath) as! CurrentRoutineCell
        print("cell name: \(cell.name.text)")
        //print("You've selected \(exercises[index].name).")
        for x in exercises {
            print(x.name)
        }
        print(exercises.count)
        if cell.icon.image != nil {
            print("has an image")
        }
        
    }
    
    
    func addExercise(e: Exercise) -> Void {
        if exercises.count < 20 { // maximum 20 exercises
            let newIndexPath = NSIndexPath(forRow: exercises.count, inSection: 0)
            exercises.append(e)
            
            tableView.rowHeight = 64 // Same integer as defined in the storyboard.
            tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom) // this creates a new row and cell.
            
        } else {
            // Ideally display an alert to let the user know that they are at the cap.
            print("Too many exercises in this routine. The cap is 20, you have \(exercises.count)")
            self.displayAlertMessage("Too many exercises. The cap is 20.")
        }
    }
    
    func saveRoutine() -> [Exercise] {
        return exercises
    }
    
    //testing alert
    
    func displayAlertMessage(UserMessage :String)
    {
        let alert = UIAlertController (title: "Error", message: UserMessage, preferredStyle: UIAlertControllerStyle.Alert);
        let passCondition = UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default, handler: nil);
        alert.addAction(passCondition)
        self.presentViewController (alert, animated : true, completion: nil);
    }
    
    
}
